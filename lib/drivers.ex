defmodule Uber.Drivers do
  use GenServer

  defstruct id: nil,
    name: nil,
    birth_day: nil,
    gender: nil,
    car_class: nil,
    license_plate: nil,
    city: nil,
    account_creation: nil,
    account_status: nil
  
  # Client

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def insert_driver(driver, pid) do
    if not String.equivalent?(Enum.at(driver, 0), "id") do
      GenServer.cast(pid, {:insert_driver, driver})
    end
  end

  def get_driver(id, pid) do
    GenServer.call(pid, {:get_driver, id})
  end

  # Server

  def init(state) do
    {:ok, state}
  end

  def handle_cast({:insert_driver, driver}, state) do

    driver_struct = %Uber.Drivers{
      id: Enum.at(driver, 0),
      name: Enum.at(driver, 1),
      birth_day: Enum.at(driver, 2),
      gender: Enum.at(driver, 3),
      car_class: Enum.at(driver, 4),
      license_plate: Enum.at(driver, 5),
      city: Enum.at(driver, 6),
      account_creation: Enum.at(driver, 7),
      account_status: Enum.at(driver, 8)
    }

    {:noreply, Map.put(state, driver_struct.id, driver_struct)}
  end

  def handle_call({:get_driver, id}, _from, state) do
    {:reply, Map.get(state, id), state}
  end
end
