defmodule PollsWeb.UserController do
  use PollsWeb, :controller
  def index(conn, _params) do
    render(conn, :index)
  end
end
