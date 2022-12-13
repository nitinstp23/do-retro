defmodule DoRetro.Boards.BoardColumn do
  use Ecto.Schema
  import Ecto.Changeset

  schema "board_columns" do
    field :color, :string
    field :name, :string
    field :board_id, :id

    timestamps()
  end

  @doc false
  def changeset(board_column, attrs) do
    board_column
    |> cast(attrs, [:name, :color])
    |> validate_required([:name, :color])
  end
end
