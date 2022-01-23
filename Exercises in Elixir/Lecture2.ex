defmodule Lecture2 do

    def append([],y) do y end
    def append([h|t], y) do
        z = append(t,y)
        [h|z]
    end

    def append2([],y) do y end
    def append2([h|t],y) do
        [h|append(t,y)]
    end

    def append3(x,y) do
        case x do
            [] -> y
            [h|t] -> [h|append(t,y)]
        end
    end

    def union([],y) do y end
    def union([h|t],y) do
        z = union(t,y)
        [h|z]
    end

    def union(lst1, lst2) do    
        case lst1 do   
            [] -> lst2
            [h|t] -> union(t, [h|lst2])
        end
    end

    def tailr([],y) do y end
    def tailr([h|t],y) do
        z = [h|y]
        tailr(t,z)        
    end

    def sum2(lst) do sum2(lst,0) end
    def sum2([],s) do s end             #s = summan vi hitills har kommit fram till. 
    def sum2([n|t],s) do
        sum2(t, n+s)
    end

    def odd([]) do [] end
    def odd([h|t]) do
        if rem(h,2) == 1 do
            [h|odd(t)]
        else
        odd(t)
        end
    end

    def even([]) do [] end
    def even([h|t]) do
        if rem(h,2) == 0 do
            [h|even(t)]
        else
        even(t)
        end
    end

    def odd_n_even(lst) do
        o = odd(lst)
        e = even(lst)
        {o,e}
    end

    def odd_n_even2([]) do {[],[]} end
    def odd_n_even2([h|t]) do
    {o,e} = odd_n_even2(t)
        if rem(h,2) == 1 do
            {[h|o], e}
        else
            {o, [h|e]}
        end
    end

    def add_n_even(lst) do add_n_even(lst, [], []) end
    def add_n_even([], odd, even) do {odd, even} end
    def add_n_even([h|t], odd, even) do
        if rem(h,2) == 1 do
            add_n_even(t, [h|odd], even)
        else
            add_n_even(t, odd, [h|even])
        end
    end

    def rev([]) do [] end
    def rev([h|t]) do
        rev(t) ++ [h]
    end

    def rav(lst) do rav(lst, []) end
    def rav([], res) do res end
    def rav([h|t], res) do
        rav(t, [h|res])
    end

    def flat([ ]) do [ ] end
    def flat([h|t]) do
        h ++ flat(t)
    end

    def flut(lst) do flut(lst, [ ]) end
    def flut([ ], r) do r end
    def flut([h|t], res) do
        flut(t, res ++ h)
    end

end