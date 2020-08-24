defmodule ImaginationSquaresPhoenixWeb.DrawingController do
  use ImaginationSquaresPhoenixWeb, :controller

  alias ImaginationSquaresPhoenix.Worlds
  alias ImaginationSquaresPhoenix.Worlds.Drawing

  def index(conn, _params) do
    drawings = Worlds.list_drawings()
    render(conn, "index.html", drawings: drawings)
  end

  def new(conn, _params) do
    changeset = Worlds.change_drawing(%Drawing{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(%{assigns: %{current_user: %{id: user_id}}} = conn, %{"drawing" => drawing_params}) do
    drawing_params = Map.put(drawing_params, "user_id", user_id)

    case Worlds.create_drawing(drawing_params) do
      {:ok, drawing} ->
        conn
        |> put_flash(:info, "Drawing created successfully.")
        |> redirect(to: Routes.drawing_path(conn, :show, drawing))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    drawing = Worlds.get_drawing!(id)
    render(conn, "show.html", drawing: drawing)
  end

  def edit(conn, %{"id" => id}) do
    drawing = Worlds.get_drawing!(id)
    changeset = Worlds.change_drawing(drawing)
    render(conn, "edit.html", drawing: drawing, changeset: changeset)
  end

  def update(conn, %{"id" => id, "drawing" => drawing_params}) do
    drawing = Worlds.get_drawing!(id)

    case Worlds.update_drawing(drawing, drawing_params) do
      {:ok, drawing} ->
        conn
        |> put_flash(:info, "Drawing updated successfully.")
        |> redirect(to: Routes.drawing_path(conn, :show, drawing))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", drawing: drawing, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    drawing = Worlds.get_drawing!(id)
    {:ok, _drawing} = Worlds.delete_drawing(drawing)

    conn
    |> put_flash(:info, "Drawing deleted successfully.")
    |> redirect(to: Routes.drawing_path(conn, :index))
  end
end
