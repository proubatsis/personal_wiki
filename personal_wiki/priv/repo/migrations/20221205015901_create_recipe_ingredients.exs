defmodule PersonalWiki.Repo.Migrations.CreateRecipeIngredients do
  use Ecto.Migration

  def change do
    create table(:recipe_ingredients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :sequence_number, :integer
      add :amount, :float
      add :recipe, references(:recipes, on_delete: :nothing, type: :binary_id)
      add :ingredient, references(:ingredients, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:recipe_ingredients, [:recipe])
    create index(:recipe_ingredients, [:ingredient])
  end
end
