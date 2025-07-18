defmodule PollsWeb.Admin.HomeController do
  use PollsWeb, :controller

  def home(conn, _params) do
    text(conn, "Admin is here!")
  end
end
