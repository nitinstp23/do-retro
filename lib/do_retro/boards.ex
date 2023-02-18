defmodule DoRetro.Boards do
  alias DoRetro.Boards.Board

  @doc """
  Returns an `%Ecto.Changeset{}` for creating a board.

  ## Examples
      iex> new_board(board, %{} = attrs)
      %Ecto.Changeset{data: %Board{}}
  """
  def new_board(%Board{} = board, attrs \\ %{}) do
    Board.changeset(board, attrs)
  end

  @doc """
  Creates a `%Board{}` for the params passed.

  ## Examples
      iex> create_board(%{} = params)
      {:ok, %Board{}}
  """
  def create_board(params \\ %{}) do
    %Board{}
    |> Board.changeset(params)
    |> DoRetro.Repo.insert()
    |> case do
      {:ok, board} ->
        {:ok, board}

      {:error, changeset} ->
        {:error, changeset}
    end
  end
end
