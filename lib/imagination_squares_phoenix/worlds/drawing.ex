defmodule ImaginationSquaresPhoenix.Worlds.Drawing do
  use Ecto.Schema
  import Ecto.Changeset
  alias ImaginationSquaresPhoenix.Users.User

  schema "drawings" do
    field :content, :map
    field :name, :string
    # field :user_id, :integer

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(drawing, attrs) do
    drawing
    |> cast(attrs, [:user_id, :name, :content])
    |> validate_required([:user_id, :name])
  end
end
