defmodule LiveViewExpoWeb.ChatLive do
  use LiveViewExpoWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      LiveViewExpoWeb.Endpoint.subscribe(topic())
      IO.inspect("connected")
    end
    {:ok, assign(socket, username: username(), messages: [])}
  end

  def handle_event("send", %{"text" => text}, socket) do
    LiveViewExpoWeb.Endpoint.broadcast(topic(), "message", %{text: text, username: socket.assigns.username})
    {:noreply, socket}
  end

  def handle_info(%{event: "message", payload: message}, socket) do
    {:noreply, assign(socket, messages: socket.assigns.messages ++ [message])}
  end

  defp username, do: "user_#{:rand.uniform(100)}"

  defp topic, do: "marx"
end
