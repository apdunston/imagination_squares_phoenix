defmodule ImaginationSquaresPhoenix.WorldsTest do
  use ImaginationSquaresPhoenix.DataCase

  alias ImaginationSquaresPhoenix.Worlds

  describe "drawings" do
    alias ImaginationSquaresPhoenix.Worlds.Drawing

    @valid_attrs %{content: %{}, name: "some name", user_id: 42}
    @update_attrs %{content: %{}, name: "some updated name", user_id: 43}
    @invalid_attrs %{content: nil, name: nil, user_id: nil}

    def drawing_fixture(attrs \\ %{}) do
      {:ok, drawing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Worlds.create_drawing()

      drawing
    end

    test "list_drawings/0 returns all drawings" do
      drawing = drawing_fixture()
      assert Worlds.list_drawings() == [drawing]
    end

    test "get_drawing!/1 returns the drawing with given id" do
      drawing = drawing_fixture()
      assert Worlds.get_drawing!(drawing.id) == drawing
    end

    test "create_drawing/1 with valid data creates a drawing" do
      assert {:ok, %Drawing{} = drawing} = Worlds.create_drawing(@valid_attrs)
      assert drawing.content == %{}
      assert drawing.name == "some name"
      assert drawing.user_id == 42
    end

    test "create_drawing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Worlds.create_drawing(@invalid_attrs)
    end

    test "update_drawing/2 with valid data updates the drawing" do
      drawing = drawing_fixture()
      assert {:ok, %Drawing{} = drawing} = Worlds.update_drawing(drawing, @update_attrs)
      assert drawing.content == %{}
      assert drawing.name == "some updated name"
      assert drawing.user_id == 43
    end

    test "update_drawing/2 with invalid data returns error changeset" do
      drawing = drawing_fixture()
      assert {:error, %Ecto.Changeset{}} = Worlds.update_drawing(drawing, @invalid_attrs)
      assert drawing == Worlds.get_drawing!(drawing.id)
    end

    test "delete_drawing/1 deletes the drawing" do
      drawing = drawing_fixture()
      assert {:ok, %Drawing{}} = Worlds.delete_drawing(drawing)
      assert_raise Ecto.NoResultsError, fn -> Worlds.get_drawing!(drawing.id) end
    end

    test "change_drawing/1 returns a drawing changeset" do
      drawing = drawing_fixture()
      assert %Ecto.Changeset{} = Worlds.change_drawing(drawing)
    end
  end
end
