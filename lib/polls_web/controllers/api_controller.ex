defmodule PollsWeb.API.HomeController do
  use PollsWeb, :controller

  def home(conn, _params) do
    json(conn, %{"status": "Healthy!"})
  end
end
