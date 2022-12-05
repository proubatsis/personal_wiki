defmodule PersonalWikiWeb.RecipeLive.Show do
  use PersonalWikiWeb, :live_view

  alias PersonalWiki.Kitchen

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:recipe, Kitchen.get_recipe!(id))}
  end

  defp page_title(:show), do: "Show Recipe"
  defp page_title(:edit), do: "Edit Recipe"
end