defmodule LiveViewExpoWeb.PageController do
  use LiveViewExpoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
