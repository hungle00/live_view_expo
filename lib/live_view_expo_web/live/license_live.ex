defmodule LiveViewExpoWeb.LicenseLive do
  use LiveViewExpoWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, seats: 3, amount: calculate(3))
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Team License</h1>
    <div id="license">
      <div class="card">
        <div class="content text-center">
          <div class="display-inline-flex align-items-center">
            <img src="images/license.svg" class="license-image">
            <span class="font-size-5">
              Your license is currently for
              <strong><%= @seats %></strong> seats.
            </span>
          </div>

          <form phx-change="update">
            <input type="range" min="1" max="10"
                  name="seats" value="<%= @seats %>" />
          </form>

          <div class="font-size-6">
            <%= @amount %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("update", %{"seats" => seats}, socket) do
    seats = String.to_integer(seats)

    socket =
      assign(socket,
        seats: seats,
        amount: calculate(seats)
      )

    {:noreply, socket}
  end

  def calculate(seats) do
    if seats <= 5 do
      seats * 20.0
    else
      100 + (seats - 5) * 15.0
    end
  end
end
