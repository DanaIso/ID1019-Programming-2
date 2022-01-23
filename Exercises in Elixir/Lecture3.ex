defmodule Lecture3 do

    def new() do [ ] end

    def add([ ], elem) do [elem] end
    def add([h|t], elem) do
        [h|add(t, elem)]
    end

    def remove([ ]) do :error end
    def remove([elem|rest]) do {:ok, elem, rest} end



    def new2() do {:queu, [], []} end

    def add2({:queu, front, back}, elem) do {:queu, front, [elem|back]} end

    def remove2({:queu, [], []}) do :error end
    def remove2({:queu, [], back}) do
        remove2({:queu, reverse(back), []})
    end
    def remove2({:queu, [elem|rest], back}) do
        {:ok, elem, {:queu, rest, back}}
    end

    def reverse(lst) do reverse(lst, []) end
    def reverse([], rev) do rev end
    def reverse([h|t], rev) do reverse(t, [h|rev]) end



    ## Inte ordnat träd ##
    def member(_, :nil) do :o end
    def member(elem, {:leaf, elem}) do :yes end
    def member(_, {:leaf, _}) do :no end
    def member(elem, {:node, elem, _, _}) do :yes end
    def member(elem, {:node, _, left, right}) do
        case member(elem, left) do
            :yes -> :yes
            :no -> case member(elem, right) do
                        :yes -> :yes
                        :no -> :no
                    end
        end
    end

    ## Ordnat träd ##
    #def member(_, :nil) do :no end
    #def member(elem, {:leaf, elem}) do :yes end
    #def member(_, {:leaf, _}) do :no end
    #def member(elem, {:node, elem, _, _}) do :yes end
    #def member(elem, {:node, e, left, right}) do
    #    if elem < e do
    #        member(elem, left)
    #    else
    #        member(elem, right)
    #    end
    #end



    def modify(_, _, :nil) do :nil end
    def modify(key, value, {:node, key, _, left, right}) do
        {:node, key, value, left, right}
    end
    def modify(key, value, {:node, k, v, left, right}) do
        if key < k do
            {:node, k, v, modify(key, value, left), right}
        else
            {:node, k, v, left, modify(key, value, right)}
        end
    end

    def lookup(_, :nil) do :no end
    def lookup(key, {:node, key, value, _, _}) do {:value, value} end
    def lookup(key, {:node, k, _, left, right}) do
        if key < k do
            lookup(key, left)
        else
            lookup(key, right)
        end
    end

end
