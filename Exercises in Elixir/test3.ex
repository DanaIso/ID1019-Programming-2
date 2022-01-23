defmodule Test do

  def roman(x) do
    case x do
      :i -> 1
      :v -> 5
      :x -> 10
      :l -> 50
      :c -> 100
      :d -> 500
      :m -> 1000
    end
  end

  def sum(x) do
    case x do
      {} -> 0
      {a} -> a
      {a,b} -> a+b
      {a,b,c} -> a+b+c
      error -> {:error, error}
    end
  end

  def age(x) do
    case x do
      {:person, a, _} -> a
      _ -> :error
    end
  end

  def double(x) do
    x * 2
  end

  def to_celsius(x) do
    (x - 32) / 1.8
  end

  def area_of_rect(x,y) do
    x*y
  end

  def area_of_circle(x) do
    :math.pi * (x * x)
  end

  def mult(x,y) do
      if x >= 0 do
        case x do
        0 -> 0
        x -> mult(x-1,y) + y
        end
      else
      mult(x+1,y) - y
    end
  end

end
