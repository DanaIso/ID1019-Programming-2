defmodule Test do

  def plus2(x) do
    x + 2
  end

  def to_fahren(c) do
    c * 1.8 + 32
  end

  def to_celsius(fahren) do
    (fahren - 32) / 1.8
  end

  def prod(a, b) do
    if a == 0 do
      0
    else
      prod(a-1, b) + b
    end
  end

  def fib(n) do
    if n == 0 do
      0
    else
      if n == 1 do
        1
      else
        fib(n-1) + fib(n-2)
      end
    end
  end

  def fib2(n) do
    case n do
      0 -> 0
      1 -> 1
      _ -> fib(n-1) + fib(n-2)
    end
  end

end
