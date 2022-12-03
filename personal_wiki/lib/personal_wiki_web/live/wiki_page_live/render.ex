defmodule PersonalWikiWeb.WikiPageLive.Render do
  use PersonalWikiWeb, :live_view

  alias PersonalWiki.Wiki

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, Wiki.get_wiki_page!(id).title)
     |> assign(:wiki_page, Wiki.get_wiki_page!(id))}
  end
end
