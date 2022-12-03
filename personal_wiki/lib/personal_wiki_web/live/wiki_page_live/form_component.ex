defmodule PersonalWikiWeb.WikiPageLive.FormComponent do
  use PersonalWikiWeb, :live_component

  alias PersonalWiki.Wiki

  @impl true
  def update(%{wiki_page: wiki_page} = assigns, socket) do
    changeset = Wiki.change_wiki_page(wiki_page)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"wiki_page" => wiki_page_params}, socket) do
    changeset =
      socket.assigns.wiki_page
      |> Wiki.change_wiki_page(wiki_page_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"wiki_page" => wiki_page_params}, socket) do
    save_wiki_page(socket, socket.assigns.action, wiki_page_params)
  end

  defp save_wiki_page(socket, :edit, wiki_page_params) do
    case Wiki.update_wiki_page(socket.assigns.wiki_page, wiki_page_params) do
      {:ok, _wiki_page} ->
        {:noreply,
         socket
         |> put_flash(:info, "Wiki page updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_wiki_page(socket, :new, wiki_page_params) do
    case Wiki.create_wiki_page(wiki_page_params) do
      {:ok, _wiki_page} ->
        {:noreply,
         socket
         |> put_flash(:info, "Wiki page created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
