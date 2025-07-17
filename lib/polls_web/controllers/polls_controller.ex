defmodule PollsWeb.PollsController do
  use PollsWeb, :controller

  def list(conn, _params) do
    render(conn, :list)
  end
end
