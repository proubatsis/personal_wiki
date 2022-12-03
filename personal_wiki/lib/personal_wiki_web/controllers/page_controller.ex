defmodule PersonalWikiWeb.PageController do
  use PersonalWikiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
