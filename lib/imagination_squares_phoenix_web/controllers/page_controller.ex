defmodule ImaginationSquaresPhoenixWeb.PageController do
  use ImaginationSquaresPhoenixWeb, :controller

  def index(%{assigns: %{current_user: user}} = conn, _params) do
    user |> IO.inspect(label: "!!ADRIAN #{__ENV__.file}:#{__ENV__.line}", pretty: true)
    email = if is_nil(user), do: nil, else: user.email
    render(conn, "index.html", [email: email, changeset: %{}])
  end
end
