defmodule PollsWeb.PageController do
  use PollsWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end


defmodule PollsWeb.Admin.HomeController do
  use PollsWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
