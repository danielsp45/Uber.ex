defmodule Uber.Parser do
  def parse(folder_path) do
    parse_drivers(folder_path <> "/drivers.csv")
    parse_users(folder_path <> "/users.csv")
    parse_rides(folder_path <> "/rides.csv")
  end

  def parse_drivers(drivers_csv) do
    drivers_csv
    |> File.stream!
    |> Enum.map(&String.split(&1, ";"))
  end

  def parse_users(users_csv) do
    users_csv
    |> File.stream!
    |> Enum.map(&String.split(&1, ";"))
  end

  def parse_rides(rides_csv) do
    rides_csv
    |> File.stream!
    |> Enum.map(&String.split(&1, ";"))
  end
end
