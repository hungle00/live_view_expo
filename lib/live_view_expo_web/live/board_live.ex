defmodule LiveViewExpoWeb.BoardLive do
  use LiveViewExpoWeb, :live_view
  alias LiveViewExpo.Kanban

  def mount(_params, %{"board_id" => board_id}, socket) do
    board = Kanban.get_board!(board_id)
    {:ok, assign(socket, :board, board)}
  end

  def handle_event("add_card", %{"column" => column_id}, socket) do
    {id, _} = Integer.parse(column_id)
    Kanban.create_card(%{column_id: id, content: "Something new"})
    new_board = Kanban.get_board!(socket.assigns.board.id)
    {:noreply, socket |> assign(:board, new_board)}
  end

  def handle_event("update_card", %{"card" => card_id, "value" => new_content}, socket) do
    {id, _} = Integer.parse(card_id)
    Kanban.get_card!(id) |> Kanban.update_card(%{content: new_content})
    new_board = Kanban.get_board!(socket.assigns.board.id)
    {:noreply, socket |> assign(:board, new_board)}
  end
end
