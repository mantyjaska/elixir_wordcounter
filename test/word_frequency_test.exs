defmodule WordFrequencyTest do
  use ExUnit.Case
  doctest WordFrequency

  test "splits and cleans the string" do
    assert WordFrequency.get_all_words("hello world!") == ["hello", "world"]
  end
end
