defmodule PollsWeb.Books.BookController do
  use PollsWeb, :controller

  def list(conn, _params) do
    books = %{
      "premchand": [
        "Mansarovar",
        "Godan",
        "Gaban"
      ],
      "rowling": [
        "philosopher's stone",
        "deathly hallows"
      ]
    }
    json(conn, books)
  end
end
