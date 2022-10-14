defmodule LiveViewExpo.KanbanTest do
  use LiveViewExpo.DataCase

  alias LiveViewExpo.Kanban

  describe "boards" do
    alias LiveViewExpo.Kanban.Board

    import LiveViewExpo.KanbanFixtures

    @invalid_attrs %{title: nil}

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Kanban.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Kanban.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Board{} = board} = Kanban.create_board(valid_attrs)
      assert board.title == "some title"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kanban.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Board{} = board} = Kanban.update_board(board, update_attrs)
      assert board.title == "some updated title"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Kanban.update_board(board, @invalid_attrs)
      assert board == Kanban.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Kanban.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Kanban.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Kanban.change_board(board)
    end
  end

  describe "columns" do
    alias LiveViewExpo.Kanban.Column

    import LiveViewExpo.KanbanFixtures

    @invalid_attrs %{title: nil}

    test "list_columns/0 returns all columns" do
      column = column_fixture()
      assert Kanban.list_columns() == [column]
    end

    test "get_column!/1 returns the column with given id" do
      column = column_fixture()
      assert Kanban.get_column!(column.id) == column
    end

    test "create_column/1 with valid data creates a column" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Column{} = column} = Kanban.create_column(valid_attrs)
      assert column.title == "some title"
    end

    test "create_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kanban.create_column(@invalid_attrs)
    end

    test "update_column/2 with valid data updates the column" do
      column = column_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Column{} = column} = Kanban.update_column(column, update_attrs)
      assert column.title == "some updated title"
    end

    test "update_column/2 with invalid data returns error changeset" do
      column = column_fixture()
      assert {:error, %Ecto.Changeset{}} = Kanban.update_column(column, @invalid_attrs)
      assert column == Kanban.get_column!(column.id)
    end

    test "delete_column/1 deletes the column" do
      column = column_fixture()
      assert {:ok, %Column{}} = Kanban.delete_column(column)
      assert_raise Ecto.NoResultsError, fn -> Kanban.get_column!(column.id) end
    end

    test "change_column/1 returns a column changeset" do
      column = column_fixture()
      assert %Ecto.Changeset{} = Kanban.change_column(column)
    end
  end

  describe "cards" do
    alias LiveViewExpo.Kanban.Card

    import LiveViewExpo.KanbanFixtures

    @invalid_attrs %{content: nil}

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Kanban.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Kanban.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{content: "some content"}

      assert {:ok, %Card{} = card} = Kanban.create_card(valid_attrs)
      assert card.content == "some content"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kanban.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      update_attrs = %{content: "some updated content"}

      assert {:ok, %Card{} = card} = Kanban.update_card(card, update_attrs)
      assert card.content == "some updated content"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Kanban.update_card(card, @invalid_attrs)
      assert card == Kanban.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Kanban.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Kanban.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Kanban.change_card(card)
    end
  end
end
