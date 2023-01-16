defmodule AdventOfCode.Day2 do
  @moduledoc """
    A Y
    B X
    C Z

    A X Rock
    B Y Paper
    C Z Scissors

    Win 6
    Draw 3
    Loss 0

    Rock 1
    Paper 2
    Scissors 3

    This strategy guide predicts and recommends the following:

    In the first round, your opponent will choose Rock (A), and you should choose Paper (Y). This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
    In the second round, your opponent will choose Paper (B), and you should choose Rock (X). This ends in a loss for you with a score of 1 (1 + 0).
    The third round is a draw with both players choosing Scissors, giving you a score of 3 + 3 = 6.
  """

  @sign_atoms %{
    "A" => :rock,
    "B" => :paper,
    "C" => :scissors
  }

  @result_atoms %{
    "X" => :loss,
    "Y" => :draw,
    "Z" => :win
  }

  @points %{
    rock: 1,
    paper: 2,
    scissors: 3,
    loss: 0,
    draw: 3,
    win: 6
  }

  defp load_file do
    File.stream!("./cache/day2.txt")
  end

  def part_0() do
    load_file()
    |> Enum.map(&String.trim_trailing/1)
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [sign, result] -> [@sign_atoms[sign], @result_atoms[result]] end)
    |> Enum.map(fn [x, y] -> @points[x] + @points[y] end)
    |> dbg()
  end

  defp foo_bar(my_list), do: Enum.map(my_list, &@tokens[&1])

  def part_1() do
    load_file()
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.split/1)
    |> Stream.map(&score/1)
    |> Enum.sum()
  end

  defp score(["A", "X"]), do: 4
  defp score(["A", "Y"]), do: 8
  defp score(["A", "Z"]), do: 3
  defp score(["B", "X"]), do: 1
  defp score(["B", "Y"]), do: 5
  defp score(["B", "Z"]), do: 9
  defp score(["C", "X"]), do: 7
  defp score(["C", "Y"]), do: 2
  defp score(["C", "Z"]), do: 6

  # X means you need to lose,
  # Y means you need to end the round in a draw, and
  # Z means you need to win.

  def part_2() do
    load_file()
    |> Enum.map(&String.trim_trailing/1)
    |> Enum.map(&String.split/1)
    |> Enum.map(&follow_correct_strategy/1)
    |> Enum.map(&score/1)
    |> Enum.sum()
    |> dbg()
  end

  # loose
  defp follow_correct_strategy([opponent, "X"]) do
    [opponent, loose(opponent)]
  end

  # draw
  defp follow_correct_strategy([opponent, "Y"]) do
    [opponent, draw(opponent)]
  end

  # win
  defp follow_correct_strategy([opponent, "Z"]) do
    [opponent, win(opponent)]
  end

  defp loose("A"), do: "Z"
  defp loose("B"), do: "X"
  defp loose("C"), do: "Y"

  defp draw("A"), do: "X"
  defp draw("B"), do: "Y"
  defp draw("C"), do: "Z"

  defp win("A"), do: "Y"
  defp win("B"), do: "Z"
  defp win("C"), do: "X"
end
