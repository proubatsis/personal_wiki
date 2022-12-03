defmodule PersonalWikiWeb.WikiPageLive.Index do
  use PersonalWikiWeb, :live_view

  alias PersonalWiki.Wiki
  alias PersonalWiki.Wiki.WikiPage

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :wiki_pages, list_wiki_pages())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Wiki page")
    |> assign(:wiki_page, Wiki.get_wiki_page!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Wiki page")
    |> assign(:wiki_page, %WikiPage{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Wiki pages")
    |> assign(:wiki_page, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    wiki_page = Wiki.get_wiki_page!(id)
    {:ok, _} = Wiki.delete_wiki_page(wiki_page)

    {:noreply, assign(socket, :wiki_pages, list_wiki_pages())}
  end

  defp list_wiki_pages do
    Wiki.list_wiki_pages()
  end
end
