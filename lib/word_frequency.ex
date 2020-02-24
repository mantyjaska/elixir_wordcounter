defmodule WordFrequency do
  @moduledoc """
  Documentation for WordFrequency.
  """

  @doc """
  Hello world.

  ## Examples

      iex> WordFrequency.hello()
      :world

  """
  def get_text(text_file) do
    File.read!(text_file)
  end

  def get_all_words(text) do
    String.split(text)
    |> Enum.map(&String.downcase/1)
    |> Enum.map(fn(w) -> String.replace(w, ~r/[".,!;:?]/, "") end)
  end

  def count_words(cleaned_words) do
    counted_words = %{}
    counted_words = Enum.reduce(cleaned_words, %{}, fn(word, acc) ->
      case Map.has_key?(acc, word) do
         :true ->
          {_status, map} = Map.get_and_update(acc, word, fn(n) -> {n, n + 1} end)
          map
        :false ->
          {_status, map} = Map.get_and_update(acc, word, fn(n) -> {n, 1} end)
          map
      end
    end
      )
    counted_words
    |> Enum.sort(fn({_, v1}, {_, v2}) -> v2 <= v1 end)
  end

  def print_results(wordcounts) do
    Enum.map(wordcounts, fn {word, count} -> 
      if(count > 10) do
        IO.puts(word <> ":" <> Integer.to_string(count)) 
      end
    end)
  end
    
  def run() do
    get_text("util/kalevala.txt")
    |> get_all_words
    |> count_words
    |> print_results
  end
end
