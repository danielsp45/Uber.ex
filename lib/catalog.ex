defmodule Uber.Catalog do
  use GenServer

  # Client
  def start_link do
    {:ok, pid_drivers} = Uber.Drivers.start_link
    {:ok, pid_users} = Uber.Users.start_link
    {:ok, pid_rides} = Uber.Rides.start_link

    catalog = %{
      drivers: pid_drivers,
      users: pid_users,
      rides: pid_rides
    }

    GenServer.start_link(__MODULE__, catalog)
  end

  def get_drivers(pid) do
    GenServer.call(pid, :get_drivers)
  end

  def get_users(pid) do
    GenServer.call(pid, :get_users)
  end

  def get_rides(pid) do
    GenServer.call(pid, :get_rides)
  end

  # Server

  def init(catalog) do
    {:ok, catalog}
  end

  def handle_call(:get_drivers, _from, catalog) do
    {:reply, Map.get(catalog, :drivers), catalog}
  end

  def handle_call(:get_users, _from, catalog) do
    {:reply, Map.get(catalog, :users), catalog}
  end

  def handle_call(:get_rides, _from, catalog) do
    {:reply, Map.get(catalog, :rides), catalog}
  end
end
