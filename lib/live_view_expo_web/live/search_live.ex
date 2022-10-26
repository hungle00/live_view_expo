defmodule LiveViewExpoWeb.SearchLive do
  use LiveViewExpoWeb, :live_view

  alias LiveViewExpo.Stores

  def mount(_params, _session, socket) do
    {:ok, assign(socket, zip: "", stores: [], loading: false)}
  end

  def render(assigns) do
    ~L"""
    <h1>Find a Store</h1>
    <div id="search">
      <form phx-submit="zip-search">
        <input type="text" name="zip" value="<%= @zip %>"
        placeholder="Zip Code" autofocus autocomplete="off"
        <%= if @loading, do: "readonly" %> />

        <button type="submit">
          Search
        </button>
      </form>

      <%= if @loading do %>
        <div class="loader">
          Loading...
        </div>
      <% end %>

      <div class="stores">
        <ul>
          <%= for store <- @stores do %>
            <li>
              <div class="first-line">
                <div class="name">
                  <%= store.name %>
                </div>
                <div class="status">
                  <%= if store.open do %>
                    <span class="open">Open</span>
                  <% else %>
                    <span class="closed">Closed</span>
                  <% end %>
                </div>
              </div>
              <div class="second-line">
                <div class="street">
                  <%= store.street %>
                </div>
                <div class="phone_number">
                  <%= store.phone_number %>
                </div>
              </div>
            </li>
          <% end %>
        </ul>
      </div>
    </div>
    """
  end

  def handle_event("zip-search", %{"zip" => zip}, socket) do
    send(self(), {:run_zip_search, zip})
    {:noreply, assign(socket, zip: zip, stores: [], loading: true)}
  end

  def handle_info({:run_zip_search, zip}, socket) do
    case Stores.search_by_zip((zip)) do
      [] ->
        socket =
          socket
          |> put_flash(:info, "No stores matching \"#{zip}\"")
          |> assign(stores: [], loading: false)

        {:noreply, socket}
      stores ->
        {:noreply, assign(socket, stores: stores, loading: false)}
    end
  end
end
