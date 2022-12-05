defmodule PersonalWiki.KitchenTest do
  use PersonalWiki.DataCase

  alias PersonalWiki.Kitchen

  describe "ingredients" do
    alias PersonalWiki.Kitchen.Ingredient

    import PersonalWiki.KitchenFixtures

    @invalid_attrs %{acceptable_measurement_units: nil, name: nil, plural_name: nil}

    test "list_ingredients/0 returns all ingredients" do
      ingredient = ingredient_fixture()
      assert Kitchen.list_ingredients() == [ingredient]
    end

    test "get_ingredient!/1 returns the ingredient with given id" do
      ingredient = ingredient_fixture()
      assert Kitchen.get_ingredient!(ingredient.id) == ingredient
    end

    test "create_ingredient/1 with valid data creates a ingredient" do
      valid_attrs = %{acceptable_measurement_units: [], name: "some name", plural_name: "some plural_name"}

      assert {:ok, %Ingredient{} = ingredient} = Kitchen.create_ingredient(valid_attrs)
      assert ingredient.acceptable_measurement_units == []
      assert ingredient.name == "some name"
      assert ingredient.plural_name == "some plural_name"
    end

    test "create_ingredient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kitchen.create_ingredient(@invalid_attrs)
    end

    test "update_ingredient/2 with valid data updates the ingredient" do
      ingredient = ingredient_fixture()
      update_attrs = %{acceptable_measurement_units: [], name: "some updated name", plural_name: "some updated plural_name"}

      assert {:ok, %Ingredient{} = ingredient} = Kitchen.update_ingredient(ingredient, update_attrs)
      assert ingredient.acceptable_measurement_units == []
      assert ingredient.name == "some updated name"
      assert ingredient.plural_name == "some updated plural_name"
    end

    test "update_ingredient/2 with invalid data returns error changeset" do
      ingredient = ingredient_fixture()
      assert {:error, %Ecto.Changeset{}} = Kitchen.update_ingredient(ingredient, @invalid_attrs)
      assert ingredient == Kitchen.get_ingredient!(ingredient.id)
    end

    test "delete_ingredient/1 deletes the ingredient" do
      ingredient = ingredient_fixture()
      assert {:ok, %Ingredient{}} = Kitchen.delete_ingredient(ingredient)
      assert_raise Ecto.NoResultsError, fn -> Kitchen.get_ingredient!(ingredient.id) end
    end

    test "change_ingredient/1 returns a ingredient changeset" do
      ingredient = ingredient_fixture()
      assert %Ecto.Changeset{} = Kitchen.change_ingredient(ingredient)
    end
  end
end
