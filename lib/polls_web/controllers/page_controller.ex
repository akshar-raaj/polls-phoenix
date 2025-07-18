defmodule PollsWeb.PageController do
  use PollsWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end
end
