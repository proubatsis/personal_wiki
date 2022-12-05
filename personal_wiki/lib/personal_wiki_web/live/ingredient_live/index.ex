defmodule PersonalWikiWeb.IngredientLive.Index do
  use PersonalWikiWeb, :live_view

  alias PersonalWiki.Kitchen
  alias PersonalWiki.Kitchen.Ingredient

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :ingredients, list_ingredients())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Ingredient")
    |> assign(:ingredient, Kitchen.get_ingredient!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Ingredient")
    |> assign(:ingredient, %Ingredient{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Ingredients")
    |> assign(:ingredient, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    ingredient = Kitchen.get_ingredient!(id)
    {:ok, _} = Kitchen.delete_ingredient(ingredient)

    {:noreply, assign(socket, :ingredients, list_ingredients())}
  end

  defp list_ingredients do
    Kitchen.list_ingredients()
  end
end
