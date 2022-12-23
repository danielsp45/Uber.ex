defmodule UberTest do
  use ExUnit.Case
  doctest Uber

  test "greets the world" do
    assert Uber.hello() == :world
  end
end
