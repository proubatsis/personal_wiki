defmodule PersonalWikiWeb.IngredientLiveTest do
  use PersonalWikiWeb.ConnCase

  import Phoenix.LiveViewTest
  import PersonalWiki.KitchenFixtures

  @create_attrs %{acceptable_measurement_units: [], name: "some name", plural_name: "some plural_name"}
  @update_attrs %{acceptable_measurement_units: [], name: "some updated name", plural_name: "some updated plural_name"}
  @invalid_attrs %{acceptable_measurement_units: [], name: nil, plural_name: nil}

  defp create_ingredient(_) do
    ingredient = ingredient_fixture()
    %{ingredient: ingredient}
  end

  describe "Index" do
    setup [:create_ingredient]

    test "lists all ingredients", %{conn: conn, ingredient: ingredient} do
      {:ok, _index_live, html} = live(conn, Routes.ingredient_index_path(conn, :index))

      assert html =~ "Listing Ingredients"
      assert html =~ ingredient.name
    end

    test "saves new ingredient", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.ingredient_index_path(conn, :index))

      assert index_live |> element("a", "New Ingredient") |> render_click() =~
               "New Ingredient"

      assert_patch(index_live, Routes.ingredient_index_path(conn, :new))

      assert index_live
             |> form("#ingredient-form", ingredient: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ingredient-form", ingredient: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ingredient_index_path(conn, :index))

      assert html =~ "Ingredient created successfully"
      assert html =~ "some name"
    end

    test "updates ingredient in listing", %{conn: conn, ingredient: ingredient} do
      {:ok, index_live, _html} = live(conn, Routes.ingredient_index_path(conn, :index))

      assert index_live |> element("#ingredient-#{ingredient.id} a", "Edit") |> render_click() =~
               "Edit Ingredient"

      assert_patch(index_live, Routes.ingredient_index_path(conn, :edit, ingredient))

      assert index_live
             |> form("#ingredient-form", ingredient: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#ingredient-form", ingredient: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ingredient_index_path(conn, :index))

      assert html =~ "Ingredient updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes ingredient in listing", %{conn: conn, ingredient: ingredient} do
      {:ok, index_live, _html} = live(conn, Routes.ingredient_index_path(conn, :index))

      assert index_live |> element("#ingredient-#{ingredient.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#ingredient-#{ingredient.id}")
    end
  end

  describe "Show" do
    setup [:create_ingredient]

    test "displays ingredient", %{conn: conn, ingredient: ingredient} do
      {:ok, _show_live, html} = live(conn, Routes.ingredient_show_path(conn, :show, ingredient))

      assert html =~ "Show Ingredient"
      assert html =~ ingredient.name
    end

    test "updates ingredient within modal", %{conn: conn, ingredient: ingredient} do
      {:ok, show_live, _html} = live(conn, Routes.ingredient_show_path(conn, :show, ingredient))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Ingredient"

      assert_patch(show_live, Routes.ingredient_show_path(conn, :edit, ingredient))

      assert show_live
             |> form("#ingredient-form", ingredient: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#ingredient-form", ingredient: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.ingredient_show_path(conn, :show, ingredient))

      assert html =~ "Ingredient updated successfully"
      assert html =~ "some updated name"
    end
  end
end
