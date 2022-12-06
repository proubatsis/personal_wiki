defmodule PersonalWiki.Repo.Migrations.CreateRecipeIngredients do
  use Ecto.Migration

  def change do
    create table(:recipe_ingredients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :sequence_number, :integer
      add :amount, :float
      add :recipe_id, references(:recipes, on_delete: :nothing, type: :binary_id)
      add :ingredient_id, references(:ingredients, on_delete: :nothing, type: :binary_id)
      add :measurement_unit, :string
      add :alternate_measurement_units, {:array, :string}

      timestamps()
    end

    create index(:recipe_ingredients, [:recipe_id])
    create index(:recipe_ingredients, [:ingredient_id])
  end
end
