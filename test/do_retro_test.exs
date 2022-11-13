defmodule DoRetroTest do
  use ExUnit.Case
  doctest DoRetro

  test "greets the world" do
    assert DoRetro.hello() == :world
  end
end
