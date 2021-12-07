defmodule AoC.Day01.SonarV2 do
  def get_result() do
    File.stream!("data/input.txt")
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.to_list
    |> checking(0)
  end

  defp checking(data, value) do
    [a, b, c | tail] = data

    counter(value, a + b + c, [b , c | tail])
  end

  defp counter(value, prev, data) do
    if length(data) >= 3 do
      [a, b, c | tail] = data
      if prev < a+b+c do
        counter(value + 1, a+b+c, [b, c | tail])
      else
        counter(value, a+b+c, [b, c | tail])
      end
    else
      value
    end
  end
end