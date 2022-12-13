defmodule DoRetro.Repo.Migrations.CreateBoards do
  use Ecto.Migration

  def change do
    create table(:boards) do
      add :name, :string
      add :max_votes_per_user, :integer
      add :hide_cards, :boolean, default: false, null: false
      add :disable_voting, :boolean, default: false, null: false
      add :hide_vote_count, :boolean, default: false, null: false
      add :owner_id, references(:users, on_delete: :restrict)

      timestamps()
    end

    create index(:boards, [:owner_id])
  end
end
