defmodule TfIdfWorker do
  @moduledoc """
  Documentation for `TfIdfWorker`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> TfIdfWorker.hello()
      :world

  """
  def main(args \\ []) do
    :timer.sleep(:infinity)
  end

  def textToWords(text) do
    text = Base.decode64!(text) |> :erlang.binary_to_term([:safe])
    String.downcase(text)
    |> String.split([" ", ".", ",", ":", ";", "!", "?", "\"", "\n", "\r"]) 
    |> Enum.filter(fn(x) -> x != "" end)
  end

  def tf(word, text) do
    text = textToWords(text)
    count = Enum.reduce(text, 0, fn(w, acc) -> if w == word, do: acc+1, else: acc end)
    count / Enum.count(text)
  end

  def isInText(word, text) do
    text = textToWords(text)
    if Enum.find_index(text, fn(w) -> w == word end) == nil, do: 0, else: 1
  end
end
