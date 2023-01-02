defmodule AdventOfCode.Day1_1 do
  use AdventOfCode.DataCase

  alias AdventOfCode.Day1

  describe "day 1" do
    test "task 1" do
      assert 74198 == Day1.part_1()
    end

    test "task 2" do
      assert 209_914 == Day1.part_2()
    end

    # test "task 2" do
    # end
  end
end
