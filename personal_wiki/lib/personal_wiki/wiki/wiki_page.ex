defmodule PersonalWiki.Wiki.WikiPage do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "wiki_pages" do
    field :content, :string
    field :page_type, Ecto.Enum, values: [:generic, :recipe]
    field :title, :string
    field :parent_page, :binary_id

    timestamps()
  end

  @doc false
  def changeset(wiki_page, attrs) do
    wiki_page
    |> cast(attrs, [:title, :page_type, :content])
    |> validate_required([:title, :page_type, :content])
  end
end
