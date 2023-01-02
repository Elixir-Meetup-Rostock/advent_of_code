defmodule AdventOfCode.Day2Test do
  use AdventOfCode.DataCase

  alias AdventOfCode.Day2
  alias AdventOfCode.Day2JansApproach

  describe "day 2" do
    test "task 1" do
      assert 15632 == Day2.part_1()
    end

    test "task 2" do
      assert 14416 == Day2.part_2()
    end

    test "task 1 jan" do
      assert 15632 == Day2JansApproach.part_1()
    end
  end
end
