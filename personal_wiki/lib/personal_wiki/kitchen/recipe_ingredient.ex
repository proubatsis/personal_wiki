defmodule PersonalWiki.Kitchen.RecipeIngredient do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "recipe_ingredients" do
    field :amount, :float
    field :sequence_number, :integer
    field :recipe, :binary_id
    field :ingredient, :binary_id

    timestamps()
  end

  @doc false
  def changeset(recipe_ingredient, attrs) do
    recipe_ingredient
    |> cast(attrs, [:sequence_number, :amount])
    |> validate_required([:sequence_number, :amount])
  end
end
