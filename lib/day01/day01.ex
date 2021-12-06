defmodule AdventOfCode.Day01.Day01 do
  def get_result() do
    File.stream!("data/input.txt")
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.to_integer/1)
    |> Stream.with_index
    |> Enum.to_list
    |> checking
  end

  defp checking(list) do
    list
    |> Enum.reduce(0, fn {elm, index}, acc ->
      if index > 0 do
        {prev, _} = Enum.at(list, index - 1)
        if (elm > prev) do
          acc + 1
        else
          acc
        end
      else
        acc
      end
    end)
  end
end