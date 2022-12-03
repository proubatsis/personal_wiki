defmodule PersonalWikiWeb.WikiPageLiveTest do
  use PersonalWikiWeb.ConnCase

  import Phoenix.LiveViewTest
  import PersonalWiki.WikiFixtures

  @create_attrs %{content: "some content", page_type: :generic, title: "some title"}
  @update_attrs %{content: "some updated content", page_type: :recipe, title: "some updated title"}
  @invalid_attrs %{content: nil, page_type: nil, title: nil}

  defp create_wiki_page(_) do
    wiki_page = wiki_page_fixture()
    %{wiki_page: wiki_page}
  end

  describe "Index" do
    setup [:create_wiki_page]

    test "lists all wiki_pages", %{conn: conn, wiki_page: wiki_page} do
      {:ok, _index_live, html} = live(conn, Routes.wiki_page_index_path(conn, :index))

      assert html =~ "Listing Wiki pages"
      assert html =~ wiki_page.content
    end

    test "saves new wiki_page", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.wiki_page_index_path(conn, :index))

      assert index_live |> element("a", "New Wiki page") |> render_click() =~
               "New Wiki page"

      assert_patch(index_live, Routes.wiki_page_index_path(conn, :new))

      assert index_live
             |> form("#wiki_page-form", wiki_page: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#wiki_page-form", wiki_page: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.wiki_page_index_path(conn, :index))

      assert html =~ "Wiki page created successfully"
      assert html =~ "some content"
    end

    test "updates wiki_page in listing", %{conn: conn, wiki_page: wiki_page} do
      {:ok, index_live, _html} = live(conn, Routes.wiki_page_index_path(conn, :index))

      assert index_live |> element("#wiki_page-#{wiki_page.id} a", "Edit") |> render_click() =~
               "Edit Wiki page"

      assert_patch(index_live, Routes.wiki_page_index_path(conn, :edit, wiki_page))

      assert index_live
             |> form("#wiki_page-form", wiki_page: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#wiki_page-form", wiki_page: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.wiki_page_index_path(conn, :index))

      assert html =~ "Wiki page updated successfully"
      assert html =~ "some updated content"
    end

    test "deletes wiki_page in listing", %{conn: conn, wiki_page: wiki_page} do
      {:ok, index_live, _html} = live(conn, Routes.wiki_page_index_path(conn, :index))

      assert index_live |> element("#wiki_page-#{wiki_page.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#wiki_page-#{wiki_page.id}")
    end
  end

  describe "Show" do
    setup [:create_wiki_page]

    test "displays wiki_page", %{conn: conn, wiki_page: wiki_page} do
      {:ok, _show_live, html} = live(conn, Routes.wiki_page_show_path(conn, :show, wiki_page))

      assert html =~ "Show Wiki page"
      assert html =~ wiki_page.content
    end

    test "updates wiki_page within modal", %{conn: conn, wiki_page: wiki_page} do
      {:ok, show_live, _html} = live(conn, Routes.wiki_page_show_path(conn, :show, wiki_page))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Wiki page"

      assert_patch(show_live, Routes.wiki_page_show_path(conn, :edit, wiki_page))

      assert show_live
             |> form("#wiki_page-form", wiki_page: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#wiki_page-form", wiki_page: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.wiki_page_show_path(conn, :show, wiki_page))

      assert html =~ "Wiki page updated successfully"
      assert html =~ "some updated content"
    end
  end
end
