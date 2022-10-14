defmodule LiveViewExpo.Kanban.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :content, :string
    belongs_to :column, LiveViewExpo.Kanban.Column

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:content, :column_id])
    |> validate_required([:content])
  end
end
