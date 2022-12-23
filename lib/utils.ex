defmodule Uber.Utils do

  def string_to_date(date_string) do
    [year, month, day] = String.split(date_string, "/")
    Date.from_erl!({String.to_integer(year), String.to_integer(month), String.to_integer(day)})
  end
end
