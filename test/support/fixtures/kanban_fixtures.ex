defmodule LiveViewExpo.KanbanFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveViewExpo.Kanban` context.
  """

  @doc """
  Generate a board.
  """
  def board_fixture(attrs \\ %{}) do
    {:ok, board} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> LiveViewExpo.Kanban.create_board()

    board
  end

  @doc """
  Generate a column.
  """
  def column_fixture(attrs \\ %{}) do
    {:ok, column} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> LiveViewExpo.Kanban.create_column()

    column
  end

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> LiveViewExpo.Kanban.create_card()

    card
  end
end
