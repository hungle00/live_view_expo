defmodule LiveViewExpoWeb.BoardLive do
  use LiveViewExpoWeb, :live_view
  alias LiveViewExpo.Kanban

  def mount(_params, %{"board_id" => board_id}, socket) do
    board = Kanban.get_board!(board_id)
    LiveViewExpoWeb.Endpoint.subscribe(topic(board_id))
    {:ok, assign(socket, :board, board)}
  end

  def handle_event("add_card", %{"column" => column_id}, socket) do
    {id, _} = Integer.parse(column_id)
    Kanban.create_card(%{column_id: id, content: "Something new"})
    new_board = Kanban.get_board!(socket.assigns.board.id)
    LiveViewExpoWeb.Endpoint.broadcast(topic(new_board.id), "board:updated", new_board)
    {:noreply, socket |> assign(:board, new_board)}
  end

  def handle_event("update_card", %{"card" => card_id, "value" => new_content}, socket) do
    {id, _} = Integer.parse(card_id)
    Kanban.get_card!(id) |> Kanban.update_card(%{content: new_content})
    new_board = Kanban.get_board!(socket.assigns.board.id)
    LiveViewExpoWeb.Endpoint.broadcast(topic(new_board.id), "board:updated", new_board)
    {:noreply, socket |> assign(:board, new_board)}
  end

  def handle_info(%{topic: message_topic, event: "board:updated", payload: board}, socket) do
    cond do
      topic(board.id) == message_topic ->
        {:noreply, assign(socket, :board, LiveViewExpo.Repo.preload(board, columns: :cards))}
      true ->
        {:noreply, socket}
    end
  end

  def topic(board_id) do
    "board:#{board_id}"
  end
end
