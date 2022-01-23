defmodule Lista do

    def tak(l) do
        case l do
            [] -> :no
            [head|_] -> head
        end
    end

    def drp(l) do
        case l do
            [] -> :no
            [_|tail] -> tail
        end
    end

    def len(l) do
        case l do
            [] -> 0
            [_|tail] -> len(tail) + 1
        end
    end

    def sum(l) do
        case l do
            [] -> 0
            [head|tail] -> sum(tail) + head
        end
    end
    
    def duplicate(l) do
        case l do
            [] -> []
            [head|tail] -> [head|[head|duplicate(tail)]]
        end
    end

    def add(x, []) do [x] end
    def add(x, [head | tail]) do
        cond do
            x == head -> :error
            true -> [head | add(x, tail)]
        end
    end

    def add(x, l) do
        cond do
            l == [] -> [x]
            (x in l) -> l
            !(x in l) -> [x|l]
        end
    end

    def remove( _ , [ ] ) do [ ] end
    def remove(x, [head | tail]) do
        cond do
            x != head -> [head | remove(x, tail)]
            x == head -> remove(x, tail)
        end
    end

    def member(_,[]) do false end
    def member(x,[h|t]) do
        if x == h do
            true
        else
            member(x,t)
        end
    end

    def unique([ ]) do [ ] end
    def unique([h|t]) do
        if !(member(h, t)) == true do
            [h|unique(t)]
        else
            unique(t)
        end
    end

    def append(lst1, lst2) do
        case lst1 do
            [ ] -> lst2
            [h | t] -> [h | append(t, lst2)]
        end
    end

    def revrs(lst) do revrs(lst, []) end
    def revrs([], acc) do acc end
    def revrs([h|t], acc) do
        revrs(t, [h|acc])
    end

    def odd([ ]) do [ ] end
    def odd([h|t]) do
        if rem(h,2) == 1 do
            [h|odd(t)]
        else
            odd(t)
        end
    end

    def odd_and_even(lst) do odd_and_even(lst, [ ], [ ]) end
    def odd_and_even([ ], odd, even) do {odd, even} end
    def odd_and_even([h|t], odd, even) do
        if rem(h,2) == 1 do
            odd_and_even(t, [h|odd], even)
        else
            odd_and_even(t, odd, [h|even])
        end
    end


end
