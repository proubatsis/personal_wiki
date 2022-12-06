defmodule PersonalWikiWeb.RecipeLive.Show do
  use PersonalWikiWeb, :live_view

  alias PersonalWiki.Kitchen
  alias PersonalWiki.Repo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:recipe, Kitchen.get_recipe!(id) |> Repo.preload(recipe_ingredients: :ingredient))}
  end

  defp page_title(:show), do: "Show Recipe"
  defp page_title(:edit), do: "Edit Recipe"

  defp recipe_ingredient_to_string(recipe_ingredient) when recipe_ingredient.measurement_unit == :unit do
    if recipe_ingredient.amount == 1.0 do
      "#{recipe_ingredient.amount} #{recipe_ingredient.ingredient.name}"
    else
      "#{recipe_ingredient.amount} #{recipe_ingredient.ingredient.plural_name}"
    end
  end

  defp recipe_ingredient_to_string(recipe_ingredient) do
    "#{recipe_ingredient.amount} #{recipe_ingredient.measurement_unit} #{recipe_ingredient.ingredient.name}"
  end

end
