defmodule PersonalWiki.WikiFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PersonalWiki.Wiki` context.
  """

  @doc """
  Generate a wiki_page.
  """
  def wiki_page_fixture(attrs \\ %{}) do
    {:ok, wiki_page} =
      attrs
      |> Enum.into(%{
        content: "some content",
        page_type: :generic,
        title: "some title"
      })
      |> PersonalWiki.Wiki.create_wiki_page()

    wiki_page
  end
end
