defmodule LiveViewExpoWeb.Api.CardController do
  use LiveViewExpoWeb, :controller
  alias LiveViewExpo.Kanban

  def update(conn, %{"id" => id, "target_column_id" => target_column_id}) do
    {:ok, card} = Kanban.get_card!(id) |> Kanban.update_card(%{column_id: target_column_id})
    new_board = card.column.board
    LiveViewExpoWeb.Endpoint.broadcast(
      LiveViewExpoWeb.BoardLive.topic(new_board.id), "board:updated", new_board
    )
    json(conn, %{"id" => card.id})
  end
end
