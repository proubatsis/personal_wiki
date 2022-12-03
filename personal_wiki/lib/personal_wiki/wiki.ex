defmodule PersonalWiki.Wiki do
  @moduledoc """
  The Wiki context.
  """

  import Ecto.Query, warn: false
  alias PersonalWiki.Repo

  alias PersonalWiki.Wiki.WikiPage

  @doc """
  Returns the list of wiki_pages.

  ## Examples

      iex> list_wiki_pages()
      [%WikiPage{}, ...]

  """
  def list_wiki_pages do
    Repo.all(WikiPage)
  end

  @doc """
  Gets a single wiki_page.

  Raises `Ecto.NoResultsError` if the Wiki page does not exist.

  ## Examples

      iex> get_wiki_page!(123)
      %WikiPage{}

      iex> get_wiki_page!(456)
      ** (Ecto.NoResultsError)

  """
  def get_wiki_page!(id), do: Repo.get!(WikiPage, id)

  @doc """
  Creates a wiki_page.

  ## Examples

      iex> create_wiki_page(%{field: value})
      {:ok, %WikiPage{}}

      iex> create_wiki_page(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_wiki_page(attrs \\ %{}) do
    %WikiPage{}
    |> WikiPage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a wiki_page.

  ## Examples

      iex> update_wiki_page(wiki_page, %{field: new_value})
      {:ok, %WikiPage{}}

      iex> update_wiki_page(wiki_page, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_wiki_page(%WikiPage{} = wiki_page, attrs) do
    wiki_page
    |> WikiPage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a wiki_page.

  ## Examples

      iex> delete_wiki_page(wiki_page)
      {:ok, %WikiPage{}}

      iex> delete_wiki_page(wiki_page)
      {:error, %Ecto.Changeset{}}

  """
  def delete_wiki_page(%WikiPage{} = wiki_page) do
    Repo.delete(wiki_page)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking wiki_page changes.

  ## Examples

      iex> change_wiki_page(wiki_page)
      %Ecto.Changeset{data: %WikiPage{}}

  """
  def change_wiki_page(%WikiPage{} = wiki_page, attrs \\ %{}) do
    WikiPage.changeset(wiki_page, attrs)
  end
end
