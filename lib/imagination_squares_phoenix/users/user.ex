defmodule ImaginationSquaresPhoenix.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  alias ImaginationSquaresPhoenix.Worlds.Drawing
  
  schema "users" do
    pow_user_fields()

    has_many(:drawings, Drawing)

    timestamps()
  end
end
