defmodule ImaginationSquaresPhoenixWeb.DrawingControllerTest do
  use ImaginationSquaresPhoenixWeb.ConnCase

  alias ImaginationSquaresPhoenix.Worlds

  @create_attrs %{content: %{}, name: "some name"}
  @update_attrs %{content: %{}, name: "some updated name"}
  @invalid_attrs %{content: nil, name: nil}

  def fixture(:drawing) do
    {:ok, drawing} = Worlds.create_drawing(@create_attrs)
    drawing
  end

  describe "index" do
    test "lists all drawings", %{conn: conn} do
      conn = get(conn, Routes.drawing_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Drawings"
    end
  end

  describe "new drawing" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.drawing_path(conn, :new))
      assert html_response(conn, 200) =~ "New Drawing"
    end
  end

  describe "create drawing" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.drawing_path(conn, :create), drawing: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.drawing_path(conn, :show, id)

      conn = get(conn, Routes.drawing_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Drawing"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.drawing_path(conn, :create), drawing: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Drawing"
    end
  end

  describe "edit drawing" do
    setup [:create_drawing]

    test "renders form for editing chosen drawing", %{conn: conn, drawing: drawing} do
      conn = get(conn, Routes.drawing_path(conn, :edit, drawing))
      assert html_response(conn, 200) =~ "Edit Drawing"
    end
  end

  describe "update drawing" do
    setup [:create_drawing]

    test "redirects when data is valid", %{conn: conn, drawing: drawing} do
      conn = put(conn, Routes.drawing_path(conn, :update, drawing), drawing: @update_attrs)
      assert redirected_to(conn) == Routes.drawing_path(conn, :show, drawing)

      conn = get(conn, Routes.drawing_path(conn, :show, drawing))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, drawing: drawing} do
      conn = put(conn, Routes.drawing_path(conn, :update, drawing), drawing: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Drawing"
    end
  end

  describe "delete drawing" do
    setup [:create_drawing]

    test "deletes chosen drawing", %{conn: conn, drawing: drawing} do
      conn = delete(conn, Routes.drawing_path(conn, :delete, drawing))
      assert redirected_to(conn) == Routes.drawing_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.drawing_path(conn, :show, drawing))
      end
    end
  end

  defp create_drawing(_) do
    drawing = fixture(:drawing)
    %{drawing: drawing}
  end
end
