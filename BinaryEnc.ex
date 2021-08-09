defmodule Binary do
    
    def to_binary(0) do [] end
    def to_binary(n) do
        append(to_binary(div(n,2)), [rem(n,2)])
    end

    def append(lst1, lst2) do
        case lst1 do
            []    -> lst2
            [h|t] -> [h|append(t, lst2)]
        end
    end

    def to_better(n) do to_better(n, []) end
    def to_better(0, b) do b end
    def to_better(n, b) do
        to_better(div(n, 2), [rem(n, 2) | b])
    end

    def to_integer(x) do to_integer(x, 0) end
    def to_integer([], n) do n end
    def to_integer([x | r], n) do
        to_integer(r, 2*n+x)
    end
    
end