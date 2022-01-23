defmodule High do
    
    @type suite :: :spade | :heart | :diamond | :club
    @type value :: 2..14
    @type card :: {:card, suite, value}


    def test() do
        deck = [{:card, :heart, 5},
                {:card, :heart, 7},
                {:card, :spade, 2},
                {:card, :club, 9},
                {:card, :diamond, 4}]
        sort(deck)
    end


    def less_than({:card, s, v1}, {:card, s, v2}) do v1 < v2 end
    def less_than({:card, :club, _}, _) do true end
    def less_than({:card, :diamond, _}, {:card, :heart, _}) do true end
    def less_than({:card, :diamond, _}, {:card, :spade, _}) do true end
    def less_than({:card, :heart, _}, {:card, :spade, _}) do true end
    def less_than({:card, _, _}, {:card, _, _}) do false end

    def sort([ ]) do [ ] end
    def sort([n]) do [n] end
    def sort(lst) do
        {a, b} = split(lst)
        merge(sort(a), sort(b))
    end

    def split(lst) do split(lst, [ ], [ ]) end
    def split([ ], a, b) do {a, b} end
    def split([h|t], a, b) do split(t, b, [h|a]) end

    def merge([], b) do b end
    def merge(a, []) do a end
    def merge([c1|r1]=s1, [c2|r2]=s2) do
        case less_than(c1, c2) do
            true -> [c1 | merge(r1, s2)]
            false -> [c2 | merge(s1, r2)]
        end
    end


    def foldr([], acc, _op) do acc end
    def foldr([h|t], acc, op) do
        op.(h, foldr(t, acc, op))
    end

    def foldl([], acc, _op) do acc end
    def foldl([h|t], acc, op) do
        foldl(t, op.(h, acc), op)
    end


    def foo(x) do
        y = 3
        fn (v) -> v + y + x end
    end

    def gurka(l) do
        f = fn(_, a) -> a + 1 end
        foldl(l, 0, f)
    end

    def tomat(l) do
        f = fn(h, a) -> a ++ [h] end
        foldr(l, [], f)
    end

    def morot(l) do
        op = fn(h,a) -> [h|a] end
        foldl(l, [], op)
    end

    def append_right(lst) do
        f = fn(e,acc) -> e ++ acc end
        foldr(lst, [], f)
    end

    def append_left(lst) do
        f = fn(e,acc) -> acc ++ e end
        foldl(lst, [], f)
    end

    def append_best(lst) do
        f = fn(e,acc) -> e ++ acc end
        foldl(lst, [], f)
    end

    ## foldr och foldl finns i Elixir-biblioteket ##
    ## om man skriver List.foldr(lst, 0, fn...) ##

    def map([], _op) do [] end
    def map([h|t], op) do
        [op.(h) | map(t, op)]
    end

    def filter([], _) do [] end
    def filter([h|t], op) do
        if op.(h) do
            [h|filter(t, op)]
        else
            filter(t, op)
        end
    end

    def split_with([], _) do [] end
    def split_with([h|t], op) do
        
    end

end