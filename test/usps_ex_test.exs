defmodule UspsExTest do
  use ExUnit.Case
  doctest UspsEx

  test "greets the world" do
    assert UspsEx.hello() == :world
  end
end
