defmodule PollsWeb.BookController do
  use PollsWeb, :controller

  def list(conn, _params) do
    text(conn, "Books are the best buy!")
  end
end
