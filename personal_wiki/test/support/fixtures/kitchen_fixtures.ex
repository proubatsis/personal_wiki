defmodule PersonalWiki.KitchenFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PersonalWiki.Kitchen` context.
  """

  @doc """
  Generate a ingredient.
  """
  def ingredient_fixture(attrs \\ %{}) do
    {:ok, ingredient} =
      attrs
      |> Enum.into(%{
        acceptable_measurement_units: [],
        name: "some name",
        plural_name: "some plural_name"
      })
      |> PersonalWiki.Kitchen.create_ingredient()

    ingredient
  end
end
