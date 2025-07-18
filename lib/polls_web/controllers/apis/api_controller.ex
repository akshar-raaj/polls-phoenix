defmodule PollsWeb.API.HomeController do
  use PollsWeb, :controller

  def home(conn, _params) do
    json(conn, %{"status": "Healthy!"})
  end

  def create_poll(conn, params) do
    IO.puts("Creating a poll")
    # Phoenix has sophisticated default parsing behaviour.
    # It reads the Content-Type and can do appropriate parsing to give a map.
    json(conn, params)
  end
end
