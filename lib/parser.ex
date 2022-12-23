defmodule Uber.Parser do

  def parse(file) when String.ends_with?(file, "drivers.csv") do
    file
    |> File.read!
    |> String.split("\n")
    |> Enum.map(&String.split(&1, ";"))
    |> Enum.map(&parse_driver(&1))
  end

  defp parse_driver(line) do
    %{
      :id => Enum.at(line, 0),
      :name => Enum.at(line, 1),
      :birth_name => Enum.at(line, 2),
      :gender => Enum.at(line, 3),
      :car_class => Enum.at(line, 4),
      :license_plate => Enum.at(line, 5),
      :city => Enum.at(line, 6),
      :account_creation => Utils.string_to_date(Enum.at(line, 7)),
      :account_status => Enum.at(line, 8)
    }
  end

  defp parse_user(line) do
    %{
      :username => Enum.at(line, 0),
      :name => Enum.at(line, 1),
      :gender => Enum.at(line, 2),
      :bith_date => Utils.string_to_date(Enum.at(line, 3)),
      :account_creation => Utils.string_to_date(Enum.at(line, 4)),
      :pay_method => Enum.at(line, 5),
      :account_status => Enum.at(line, 6)
    }
  end

  defp parse_ride(line) do
    %{
      :id => Enum.at(line, 0),
      :date => Utils.string_to_date(Enum.at(line, 1)),
      :driver => Enum.at(line, 2),
      :user => Enum.at(line, 3),
      :city => Enum.at(line, 4),
      :distance => String.to_integer(Enum.at(line, 5)),
      :score_user => Enum.at(line, 6),
      :score_driver => String.to_integer(Enum.at(line, 7)),
      :tip => String.to_integer(Enum.at(line, 8)),
      :comment => Enum.at(line, 9),
    }
  end
end
