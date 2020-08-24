defmodule ImaginationSquaresPhoenixWeb.PageController do
  use ImaginationSquaresPhoenixWeb, :controller
  alias ImaginationSquaresPhoenix.Worlds.Drawing
  alias ImaginationSquaresPhoenix.Repo

  def index(%{assigns: %{current_user: user}} = conn, _params) do    
    render(conn, "index.html", [
      user: Repo.preload(user, :drawings), 
      new_drawing: Drawing.changeset(%Drawing{}, %{})
    ])
  end
end
