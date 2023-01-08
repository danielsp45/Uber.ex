defmodule Uber.Parser do
  alias Uber.{Catalog, Drivers, Users, Rides}

  def parse(catalog_pid, folder_path) do
    parse_drivers(catalog_pid, folder_path <> "/drivers.csv")
    parse_users(catalog_pid, folder_path <> "/users.csv")
    parse_rides(catalog_pid, folder_path <> "/rides.csv")
  end

  def parse_drivers(catalog_pid, drivers_csv) do
    drivers_pid = Catalog.get_drivers(catalog_pid)

    drivers_csv
    |> File.stream!
    |> Enum.map(&String.split(&1, ";"))
    |> Enum.each(fn driver ->
      Drivers.insert_driver(driver, drivers_pid)
    end)
  end

  def parse_users(catalog_pid, users_csv) do
    users_pid = Catalog.get_users(catalog_pid)

    users_csv
    |> File.stream!
    |> Enum.map(&String.split(&1, ";"))
    |> Enum.each(fn user ->
      Users.insert_user(user, users_pid)
    end)
  end

  def parse_rides(catalog_pid, rides_csv) do
    rides_pid = Catalog.get_rides(catalog_pid)

    rides_csv
    |> File.stream!
    |> Enum.map(&String.split(&1, ";"))
    |> Enum.each(fn ride ->
      Rides.insert_ride(ride, rides_pid)
    end)
  end
end
