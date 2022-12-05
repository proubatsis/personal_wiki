defmodule PersonalWikiWeb.IngredientLive.FormComponent do
  use PersonalWikiWeb, :live_component

  alias PersonalWiki.Kitchen

  @impl true
  def update(%{ingredient: ingredient} = assigns, socket) do
    changeset = Kitchen.change_ingredient(ingredient)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"ingredient" => ingredient_params}, socket) do
    changeset =
      socket.assigns.ingredient
      |> Kitchen.change_ingredient(ingredient_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"ingredient" => ingredient_params}, socket) do
    save_ingredient(socket, socket.assigns.action, ingredient_params)
  end

  defp save_ingredient(socket, :edit, ingredient_params) do
    case Kitchen.update_ingredient(socket.assigns.ingredient, ingredient_params) do
      {:ok, _ingredient} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ingredient updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_ingredient(socket, :new, ingredient_params) do
    case Kitchen.create_ingredient(ingredient_params) do
      {:ok, _ingredient} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ingredient created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
