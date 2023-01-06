defmodule Uber.Parser do

  def parse_drivers(filename) do
    filename
    |> Path.expand(__DIR__)
    |> File.stream!
    |> CSV.decode!
    |> Enum.take_every(1)
  end

  # def parse_users(users_csv) do
  # end

  # def parse_rides(rides_csv) do
  # end
end
