defmodule Inf do
    
    def sumr({:range, from, from}) do from end
    def sumr({:range, from, to}) do
        from + sumr({:range, from+1, to})
    end 

    def prodr({:range, from, from}) do from end
    def prodr({:range, from, to}) do
        from * prodr({:range, from+1, to})
    end 

    def infi() do fn() -> infi(0) end end
    def infi(n) do [n|fn() -> infi(n+1) end] end



    def reduce({:range, from, to}, {:cont, acc}, func) do
        if from <= to do
            reduce({:range, from+1, to}, func.(from, acc), func)
        else
            {:done, acc}
        end
    end
    def reduce(_, {:halt, acc}, _) do {:halted, acc} end


    def sum(range) do 
        reduce(range, {:cont, 0}, fn(x, acc) -> x + acc end)
    end

    def prod(range) do
        reduce(range, {:cont, 1}, fn(x, acc) -> x * acc end)
    end

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

end