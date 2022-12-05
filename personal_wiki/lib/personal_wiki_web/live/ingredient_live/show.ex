defmodule PersonalWikiWeb.IngredientLive.Show do
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
     |> assign(:ingredient, Kitchen.get_ingredient!(id))}
  end

  defp page_title(:show), do: "Show Ingredient"
  defp page_title(:edit), do: "Edit Ingredient"

  defp comma_separated_units(ingredient) do
    Enum.join(Enum.map(ingredient.acceptable_measurement_units, &to_string/1), ", ")
  end
end
