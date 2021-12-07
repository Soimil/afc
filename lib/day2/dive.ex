defmodule AoC.Day02.Dive do
  def get_result() do
    file =
      [__DIR__, "input.txt"]
      |> Path.join()

    File.stream!(file)
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.split/1)
    |> Stream.map(fn [a, b] -> [a, String.to_integer(b)] end)
    |> Enum.to_list()
    |> dive_submarine
  end

  defp dive_submarine(data) do
    [horizontal, depth] =
      data
      |> Enum.reduce([0, 0], fn row, acc -> go_to(row, acc) end)

    horizontal * depth
  end

  defp go_to(["up", points], [horizontal, depth]), do: [horizontal, depth - points]
  defp go_to(["down", points], [horizontal, depth]), do: [horizontal, depth + points]
  defp go_to(["forward", points], [horizontal, depth]), do: [horizontal + points, depth]
end
