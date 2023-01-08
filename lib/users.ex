defmodule Uber.Users do
  use GenServer

  defstruct username: nil,
    name: nil,
    gender: nil,
    birth_day: nil,
    account_creation: nil,
    payment_method: nil,
    account_status: nil

  # Client

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def insert_user(user, pid) do
    if not String.equivalent?(Enum.at(user, 0), "username") do
      GenServer.cast(pid, {:insert_user, user})
    end
  end

  def get_user(username, pid) do
    GenServer.call(pid, {:get_driver, username})
  end
  # Server

  def init(state) do
    {:ok, state}
  end

  def handle_cast({:insert_user, user}, state) do
    user_struct = %Uber.Users{
      username: Enum.at(user, 0),
      name: Enum.at(user, 1),
      gender: Enum.at(user, 2),
      birth_day: Enum.at(user, 3),
      account_creation: Enum.at(user, 4),
      payment_method: Enum.at(user, 5),
      account_status: Enum.at(user, 6)
    }

    {:noreply, Map.put(state, user_struct.username, user_struct)}
  end

  def handle_call({:get_user, username}, _from, state) do
    {:reply, Map.get(state, username), state}
  end
end
