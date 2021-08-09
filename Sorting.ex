defmodule Sorting do
    
    def insert(elem, [ ]) do [elem] end
    def insert(elem, [h|t]) when elem < h do [elem, h | t] end
    def insert(elem, [h|t]) do [h | insert(elem, t)] end

    def isort(lst) do isort(lst, [ ]) end 
    def isort([ ], lst) do lst end
    def isort([h|t], [ ]) do isort(t, insert(h, [ ])) end
    def isort([h|t], lst) do isort(t, insert(h, lst)) end

end