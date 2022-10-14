defmodule LiveViewExpoWeb.BoardController do
  use LiveViewExpoWeb, :controller
  import Phoenix.LiveView.Controller

  def show(conn, %{"id" => id}) do
    live_render(conn, LiveViewExpoWeb.BoardLive, session: %{"board_id" => id})
  end
end
