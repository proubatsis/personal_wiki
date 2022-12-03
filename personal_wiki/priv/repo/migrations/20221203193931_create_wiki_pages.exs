defmodule PersonalWiki.Repo.Migrations.CreateWikiPages do
  use Ecto.Migration

  def change do
    create table(:wiki_pages, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :page_type, :string
      add :content, :text
      add :parent_page, references(:wiki_pages, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:wiki_pages, [:parent_page])
  end
end
