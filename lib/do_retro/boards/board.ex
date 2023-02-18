defmodule DoRetro.Boards.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :disable_voting, :boolean, default: false
    field :hide_cards, :boolean, default: false
    field :hide_vote_count, :boolean, default: false
    field :max_votes_per_user, :integer, default: 5
    field :name, :string
    field :owner_id, :id

    timestamps()
  end

  @required_fields [:name, :owner_id]
  @optional_fields [:max_votes_per_user, :hide_cards, :disable_voting, :hide_vote_count]

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
