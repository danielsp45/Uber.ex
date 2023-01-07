defmodule Uber.Rides do
  use GenServer

  defstruct id: nil,
    date: nil,
    driver: nil,
    user: nil,
    city: nil,
    distance: nil,
    score_user: nil,
    score_driver: nil,
    tip: nil,
    comment: nil

  # Client

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  # Server

  def init(state) do
    {:ok, state}
  end
end
