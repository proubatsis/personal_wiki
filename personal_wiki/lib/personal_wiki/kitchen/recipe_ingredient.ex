defmodule PersonalWiki.Kitchen.RecipeIngredient do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "recipe_ingredients" do
    field :amount, :float
    field :sequence_number, :integer

    field :measurement_unit, Ecto.Enum, values: [:unit, :g, :kg, :tsp, :tbsp, :cup]

    belongs_to :recipe, PersonalWiki.Kitchen.Recipe
    belongs_to :ingredient, PersonalWiki.Kitchen.Ingredient

    timestamps()
  end

  @doc false
  def changeset(recipe_ingredient, attrs) do
    recipe_ingredient
    |> cast(attrs, [:sequence_number, :amount])
    |> validate_required([:sequence_number, :amount])
  end
end
