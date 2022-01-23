defmodule Dynamic do
    
    def fib(0) do {0, nil} end
    def fib(1) do {1, 0} end
    def fib(n) do
        {n1, n2} = fib(n-1)
        {n1+n2, n1}
    end

end