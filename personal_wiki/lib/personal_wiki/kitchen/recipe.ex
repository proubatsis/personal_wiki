defmodule PersonalWiki.Kitchen.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "recipes" do
    field :name, :string

    has_many :recipe_ingredients, PersonalWiki.Kitchen.RecipeIngredient, on_delete: :delete_all
    has_many :ingredients, through: [:recipe_ingredients, :ingredient]

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
