defmodule PersonalWiki.Repo.Migrations.CreateIngredients do
  use Ecto.Migration

  def change do
    create table(:ingredients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :plural_name, :string
      add :acceptable_measurement_units, {:array, :string}, default: []

      timestamps()
    end
  end
end
