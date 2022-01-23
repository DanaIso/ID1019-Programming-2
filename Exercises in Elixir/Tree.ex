defmodule Tree do
    
    #####################################
    ###     Binary tree with leafs    ###
    #####################################
    def in_tree(_, :nil) do :no end
    def in_tree(elem, {:leaf, elem}) do :yes end
    def in_tree(_, {:leaf, _}) do :no end
    def in_tree(elem, {:node, elem, _, _}) do :yes end
    def in_tree(elem, {:node, e, left, _}) when elem < e do in_tree(elem, left) end
    def in_tree(elem, {:node, _, _, right}) do in_tree(elem, right) end

    def put_in_tree(elem, :nil) do {:leaf, elem} end
    def put_in_tree(elem, {:leaf, e}) when elem < e do {:node, e, {:leaf, elem}, :nil} end
    def put_in_tree(elem, {:leaf, e}) do {:node, e, :nil, {:leaf, elem}} end
    def put_in_tree(elem, {:node, e, left, right}) when elem < e do {:node, e, put_in_tree(elem, left), right} end
    def put_in_tree(elem, {:node, e, left, right}) do {:node, e, left, put_in_tree(elem, right)} end

    def dele(_, :nil) do :no end
    def dele(elem, {:leaf, elem}) do :nil end 
    def dele(elem, {:node, elem, :nil, right}) do right end
    def dele(elem, {:node, elem, left, :nil}) do left end
    def dele(elem, {:node, elem, left, right}) do
        {:leaf, big} = largest(left)
        deleted = dele(big, left)
        {:node, big, deleted, right}
    end
    def dele(elem, {:node, e, left, right}) when elem < e do {:node, e, dele(elem, left), right} end
    def dele(elem, {:node, e, left, right}) do {:node, e, left, dele(elem, right)} end

    def largest({:leaf, elem}) do {:leaf, elem} end
    def largest({:node, _, _, right}) do largest(right) end


    ################################################################################################
    ################################################################################################


    #####################################
    ###       A key-value store       ###
    #####################################
    def a_random_tree() do {:node, :p, 10, {:node, :g, 23, {:node, :c, 3, :nil, :nil}, {:node, :i, 7, :nil, :nil}}, {:node, :r, 9, :nil, :nil}} end

    def lookup(_, :nil) do :no end
    def lookup(key, {:node, key, value, _, _}) do {:value, value} end
    def lookup(key, {:node, k, _, left, _}) when key < k do lookup(key, left) end
    def lookup(key, {:node, _, _, _, right}) do lookup(key, right) end
    
    def remove(_, :nil) do :no end
    def remove(key, {:node, key, _, :nil, :nil}) do :nil end
    def remove(key, {:node, key, _, :nil, right}) do right end
    def remove(key, {:node, key, _, left, :nil}) do left end
    def remove(key, {:node, key, _, left, right}) do
        {:ok, bigleft, bval} = most_right(left)
        deleted_from_left = remove(bigleft, left)
        {:node, bigleft, bval, deleted_from_left, right}
    end
    def remove(key, {:node, k, v, left, right}) when key < k do {:node, k, v, remove(key, left), right} end
    def remove(key, {:node, k, v, left, right}) do {:node, k, v, left, remove(key, right)} end

    def most_right({:node, key, value, _, :nil}) do {:ok, key, value} end
    def most_right({:node, _, _, _, right}) do most_right(right) end

    def add(key, value, :nil) do {:node, key, value, :nil, :nil} end
    def add(key, value, {:node, k, v, left, right}) when key < k do {:node, k, v, add(key, value, left), right} end
    def add(key, value, {:node, k, v, left, right}) do {:node, k, v, left, add(key, value, right)} end

    def modify(_, _, :nil) do :nil end
    def modify(key, value, {:node, key, _, left, right}) do {:node, key, value, left, right} end
    def modify(key, value, {:node, k, v, left, right}) when key < k do {:node, k, v, modify(key, value, left), right} end
    def modify(key, value, {:node, k, v, left, right}) do {:node, k, v, left, modify(key, value, right)} end

end