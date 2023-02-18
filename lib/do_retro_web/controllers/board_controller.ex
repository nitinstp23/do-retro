defmodule DoRetroWeb.BoardController do
  use DoRetroWeb, :controller
  import Ecto.Query, only: [order_by: 2]

  alias DoRetro.Boards
  alias DoRetro.Boards.Board

  def index(conn, _params) do
    boards =
      DoRetro.Boards.Board
      |> order_by(desc: :inserted_at)
      |> DoRetro.Repo.all()

    conn
    |> assign(:boards, boards)
    |> render("index.html")
  end

  def new(conn, _params) do
    changeset = Boards.new_board(%Board{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"board" => board_params}) do
    board_params
    |> Map.put("owner_id", conn.assigns.current_user.id)
    |> Boards.create_board()
    |> case do
      {:ok, _board} ->
        conn
        |> put_flash(:info, "Board created successfully")
        |> redirect(to: Routes.board_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
