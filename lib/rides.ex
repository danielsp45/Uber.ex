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

  def insert_ride(ride, pid) do
    if not String.equivalent?(Enum.at(ride, 0), "id") do
      GenServer.cast(pid, {:insert_ride, ride})
    end
  end

  def get_ride(id, pid) do
    GenServer.call(pid, {:get_ride, id})
  end

  # Server

  def init(state) do
    {:ok, state}
  end

  def handle_cast({:insert_ride, ride}, state) do
    ride_struct = %Uber.Rides{
      id: Enum.at(ride, 0),
      date: Enum.at(ride, 1),
      driver: Enum.at(ride, 2),
      user: Enum.at(ride, 3),
      city: Enum.at(ride, 4),
      distance: Enum.at(ride, 5),
      score_user: Enum.at(ride, 6),
      score_driver: Enum.at(ride, 7),
      tip: Enum.at(ride, 8),
      comment: Enum.at(ride, 9)
    }

    {:noreply, Map.put(state, ride_struct.id, ride_struct)}
  end

  def handle_call({:get_ride, id}, _from, state) do
    {:reply, Map.get(state, id), state}
  end
end
