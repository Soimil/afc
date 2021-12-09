defmodule AoC.Day03.BinaryDiagnostic do
  def get_result() do
    file =
      [__DIR__, "input.txt"]
      |> Path.join()

    File.stream!(file)
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.split(&1, "", trim: true))
    |> Stream.map(&Enum.map(&1, fn a -> String.to_integer(a) end))
    |> Enum.to_list()
    |> diagnostic_decode
    |> to_gamma_and_epsilon
    |> calculate
  end

  defp diagnostic_decode(data) do
    elements =
      data
      |> List.first()
      |> length

    data
    |> Enum.reduce(List.duplicate(0, elements), fn row, acc -> decoder(row, acc) end)
  end

  defp decoder(row, acc) do
    acc
    |> Enum.with_index()
    |> Enum.map(fn {elm, index} ->
      n = Enum.at(row, index)

      case n do
        0 ->
          elm - 1

        1 ->
          elm + 1
      end
    end)
  end

  defp to_gamma_and_epsilon(data) do
    IO.inspect(data)
    gama =
      data
      |> Enum.map(fn e ->
        if e > 0 do
          1
        else
          0
        end
      end)
      |> Enum.join()
      |> IO.inspect()
      |> Integer.parse(2)
      |> elem(0)

    epsilon =
      data
      |> Enum.map(fn e ->
        if e > 0 do
          0
        else
          1
        end
      end)
      |> Enum.join()
      |> IO.inspect()
      |> Integer.parse(2)
      |> elem(0)

    IO.inspect([gama, epsilon])
    [gama, epsilon]
  end

  defp calculate([gama, epsilon]) do
    gama * epsilon
  end
end
