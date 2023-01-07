defmodule Uber.Drivers do
  use GenServer

  defstruct id: nil,
    name: nil,
    birth_name: nil,
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

  # Server

  def init(state) do
    {:ok, state}
  end
end
