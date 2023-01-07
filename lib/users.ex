defmodule Uber.Users do
  use GenServer

  defstruct username: nil,
    name: nil,
    gender: nil,
    birth_date: nil,
    account_creation: nil,
    payment_method: nil,
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
