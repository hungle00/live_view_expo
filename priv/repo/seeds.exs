# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveViewExpo.Repo.insert!(%LiveViewExpo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

board = LiveViewExpo.Repo.insert!(%LiveViewExpo.Kanban.Board{title: "Awesome project"})


backlog = LiveViewExpo.Repo.insert!(%LiveViewExpo.Kanban.Column{title: "To do", board_id: board.id})


_in_progress = LiveViewExpo.Repo.insert!(%LiveViewExpo.Kanban.Column{title: "In progress", board_id: board.id})
_done = LiveViewExpo.Repo.insert!(%LiveViewExpo.Kanban.Column{title: "Done", board_id: board.id})


_card = LiveViewExpo.Repo.insert!(%LiveViewExpo.Kanban.Card{content: "Put some nice cat picture on the homepage", column_id: backlog.id})
