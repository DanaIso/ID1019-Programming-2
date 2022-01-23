defmodule Tree do
    
    def member(_, :nil) do :no end
    def member(elem, {:leaf, elem}) do :yes end
    def member(_, {:leaf, _}) do :no end
    def member(elem, {:node, elem, _, _}) do :yes end
    def member(elem, {:node, e, left, right}) do
        if elem < e do
            member(elem, left)
        else
            member(elem, right)
        end
    end


    def insert(elem, :nil) do {:leaf, elem} end
    def insert(elem, {:leaf, e}) when elem < e do {:node, e, {:leaf, elem}, :nil} end
    def insert(elem, {:leaf, e}) do {:node, e, :nil, {:leaf, elem}} end
    def insert(elem, {:node, e, left, right}) when elem < e do {:node, e, insert(elem, left), right} end
    def insert(elem, {:node, e, left, right}) do {:node, e, left, insert(elem, right)} end
    

    #def delete(elem, {:leaf, elem}) do :nil end
    #def delete(elem, {:node, elem, :nil, right}) do  end
    #def delete(elem, {:node, elem, left, :nil}) do  end


    def newtree() do :nil end

    def lookup(_, :nil) do :no end
    def lookup(key, {:node, key, value, _, _}) do {:ok, value} end
    def lookup(key, {:node, k, _, left, _}) when key < k do lookup(key, left) end
    def lookup(key, {:node, _, _, _, right}) do lookup(key, right) end

    def modify(_, _, :nil) do :nil end
    def modify(key, value, {:node, key, _, left, right}) do {:node, key, value, left, right} end
    def modify(key, value, {:node, k, v, left, right}) when key < k do {:node, k, v, modify(key, value, left), right} end
    def modify(key, value, {:node, k, v, left, right}) do {:node, k, v, left, modify(key, value, right)} end

    def add(key, value, :nil) do {:node, key, value, :nil, :nil} end
    def add(key, value, {:node, k, v, left, right}) when key < k do {:node, k, v, add(key, value, left), right} end
    def add(key, value, {:node, k, v, left, right}) do {:node, k, v, left, add(key, value, right)} end

    def remove(key, {:node, key, _, :nil, :nil}) do :nil end
    def remove(key, {:node, key, _, :nil, right}) do right end
    def remove(key, {:node, key, _, left, :nil}) do left end
    def remove(_, {:node, _, _, left, right}) do
        {:ok, big, bval} = largest(left)
        deleted = remove(big, left)
        {:node, big, bval, deleted, right}
    end
    def remove(key, {:node, k, v, left, right}) when key < k do {:node, k, v, remove(key, left), right} end
    def remove(key, {:node, k, v, left, right}) do {:node, k, v, left, remove(key, right)} end

    def largest({:node, key, val, _, :nil}) do {:ok, key, val} end
    def largest({:node, _, _, _, right}) do largest(right) end

end