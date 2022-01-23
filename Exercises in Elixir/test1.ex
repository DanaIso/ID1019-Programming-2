defmodule M do
  def main do
    name = IO.gets("What is your name? ") |> String.trim
    IO.puts "Hello #{name}"
    data_grejer()
    gora_grejer()
  end

  def data_grejer do
    min_int = 127
    IO.puts "Integer #{is_integer(min_int)}"

    min_float = 3.14
    IO.puts "Float #{is_float(min_float)}"

    IO.puts "Atom #{is_atom(:Cali)}"

    one_to_10 = 1..10
  end

  def gora_grejer do
    min_string = "Min mening"
    IO.puts "Length : #{String.length(min_string)}"

    longer_str = min_string <> " " <> "är längre"

    IO.puts "Equal : #{"Egg" === "egg"}"

    IO.puts "Min ? #{String.contains?(min_string, "Min")}"

    IO.puts "First : #{String.first(min_string)}"

    IO.puts "Index 4 : #{String.at(min_string, 4)}"

    IO.puts "Substring : #{String.slice(min_string, 3, 7)}"
  end

end
