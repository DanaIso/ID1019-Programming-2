defmodule Infinite do
    
    ## Representation of range: {:range, 1, 10} ##

    def sum(range) do reduce(range, {:cont, 0}, fn(e,acc) -> {:cont, e + acc} end) end

    def prod(range) do reduce(range, {:cont, 1}, fn(e,acc) -> {:cont, e * acc} end) end

    def take(range, n) do
        reduce(range, {:cont, {:sofar, 0, []}}, fn(x, {:sofar, s, acc}) -> 
            s = s+1
            if s >= n do
                {:halt, Enum.reverse([x|acc])}
            else
                {:cont, {:sofar, s, [x|acc]}}
            end
        end)
    end

    def head(range) do
        reduce(range, {:cont, :na}, 
            fn(x, _) -> {:suspend, x} end)
    end

    def reduce({:range, from, to}, {:cont, acc}, func) do
        if from <= to do
            reduce({:range, from+1, to}, func.(from, acc), func)
        else
            {:done, acc}
        end
    end
    def reduce(range, {:suspend, acc}, func) do
        {:suspended, acc, fn(cmd) -> reduce(range, cmd, func) end}
    end
    def reduce(_, {:halt, acc}, _) do {:halted, acc} end

    def sumr({:range, from, from}) do from end
    def sumr({:range, from, to}) do
        from + sumr({:range, from+1, to})
    end

    def fib() do fn() -> fib(1,1) end end
    def fib(f1, f2) do 
        [f1|fn() -> fib(f2, f1+f2) end] 
    end

    def infinity() do fn() -> infinity(0) end end
    def infinity(n) do [n|fn() -> infinity(n+1) end] end

end