defmodule PersonalWiki.WikiTest do
  use PersonalWiki.DataCase

  alias PersonalWiki.Wiki

  describe "wiki_pages" do
    alias PersonalWiki.Wiki.WikiPage

    import PersonalWiki.WikiFixtures

    @invalid_attrs %{content: nil, page_type: nil, title: nil}

    test "list_wiki_pages/0 returns all wiki_pages" do
      wiki_page = wiki_page_fixture()
      assert Wiki.list_wiki_pages() == [wiki_page]
    end

    test "get_wiki_page!/1 returns the wiki_page with given id" do
      wiki_page = wiki_page_fixture()
      assert Wiki.get_wiki_page!(wiki_page.id) == wiki_page
    end

    test "create_wiki_page/1 with valid data creates a wiki_page" do
      valid_attrs = %{content: "some content", page_type: :generic, title: "some title"}

      assert {:ok, %WikiPage{} = wiki_page} = Wiki.create_wiki_page(valid_attrs)
      assert wiki_page.content == "some content"
      assert wiki_page.page_type == :generic
      assert wiki_page.title == "some title"
    end

    test "create_wiki_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wiki.create_wiki_page(@invalid_attrs)
    end

    test "update_wiki_page/2 with valid data updates the wiki_page" do
      wiki_page = wiki_page_fixture()
      update_attrs = %{content: "some updated content", page_type: :recipe, title: "some updated title"}

      assert {:ok, %WikiPage{} = wiki_page} = Wiki.update_wiki_page(wiki_page, update_attrs)
      assert wiki_page.content == "some updated content"
      assert wiki_page.page_type == :recipe
      assert wiki_page.title == "some updated title"
    end

    test "update_wiki_page/2 with invalid data returns error changeset" do
      wiki_page = wiki_page_fixture()
      assert {:error, %Ecto.Changeset{}} = Wiki.update_wiki_page(wiki_page, @invalid_attrs)
      assert wiki_page == Wiki.get_wiki_page!(wiki_page.id)
    end

    test "delete_wiki_page/1 deletes the wiki_page" do
      wiki_page = wiki_page_fixture()
      assert {:ok, %WikiPage{}} = Wiki.delete_wiki_page(wiki_page)
      assert_raise Ecto.NoResultsError, fn -> Wiki.get_wiki_page!(wiki_page.id) end
    end

    test "change_wiki_page/1 returns a wiki_page changeset" do
      wiki_page = wiki_page_fixture()
      assert %Ecto.Changeset{} = Wiki.change_wiki_page(wiki_page)
    end
  end
end
