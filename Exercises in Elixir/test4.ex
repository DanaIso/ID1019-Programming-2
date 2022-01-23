defmodule Test do

    def power(x,y) do
        case y do
            0 -> 1
            _ -> power(x, y-1) * x
        end
    end

    def qpower(x,y) do

    end

    def fibo(x) do
        case x do
            0 -> 0
            1 -> 1
            _ -> fibo(x-1) + fibo(x-2)
        end
    end

    def ackermann(m,n) do
        case m do
            0 -> n+1
            (m>0) and (n==0) -> ackermann(m-1, 1)
            _ -> ackermann(m-1, ackermann(m, n-1))
        end
    end

end
