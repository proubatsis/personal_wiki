defmodule PersonalWiki.Kitchen.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "ingredients" do
    field :acceptable_measurement_units, {:array, Ecto.Enum}, values: [:unit, :g, :kg, :tsp, :tbsp, :cup]
    field :name, :string
    field :plural_name, :string

    timestamps()
  end

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:name, :plural_name, :acceptable_measurement_units])
    |> validate_required([:name, :plural_name, :acceptable_measurement_units])
  end
end
