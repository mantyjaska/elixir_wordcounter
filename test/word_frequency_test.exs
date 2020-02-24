defmodule WordFrequencyTest do
  use ExUnit.Case
  doctest WordFrequency
  import ExUnit.CaptureIO

  test "splits and cleans the string" do
    assert WordFrequency.get_all_words("hello world!") == ["hello", "world"]
  end

  test "count the words" do
    assert WordFrequency.count_words(["test", "test", "test"]) == [{"test", 3}]
  end

  test "get output of results" do
    assert capture_io(fn -> WordFrequency.print_results([{"foo", 20}]) end) == "foo:20\n"
  end
end
