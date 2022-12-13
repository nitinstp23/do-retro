defmodule DoRetro.Repo.Migrations.CreateBoardColumns do
  use Ecto.Migration

  def change do
    create table(:board_columns) do
      add :name, :string
      add :color, :string
      add :board_id, references(:boards, on_delete: :delete_all)

      timestamps()
    end

    create index(:board_columns, [:board_id])
  end
end
