defmodule LiveViewExpo.Company do
  @moduledoc """
  The Kanban context.
  """

  import Ecto.Query, warn: false
  alias LiveViewExpo.Repo

  alias LiveViewExpo.Company.Customer

  def list_customers do
    Repo.all(Customer)
  end

  def list_customers(limit, id \\ 0) do
    from(p in Customer, where: p.id > ^id, limit: ^limit)
    |> Repo.all
  end
end
