defmodule PollsWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use PollsWeb, :html

  embed_templates "page_html/*"
end


defmodule PollsWeb.Admin.HomeHTML do
  use PollsWeb, :html
  def home(assigns) do
    ~H"""
      Only admin can reach here!
    """
  end
end
