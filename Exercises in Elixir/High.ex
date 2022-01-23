defmodule Higher do
    
    @type suite :: :spade | :heart | :diamond | :club
    @type value :: 2..14
    @type card :: {:card, suite, value}


    def test() do
        deck = [{:card, :heart, 5},
                {:card, :heart, 7},
                {:card, :spade, 2},
                {:card, :club, 9},
                {:card, :diamond, 4}]
        #sort(deck)
    end


    def lt({:card, suite, v1}, {:card, suite, v2}) do v1 < v2 end
    def lt({:card, :club, _}, _) do true end
    def lt({:card, :diamond, _}, {:card, :heart, _}) do true end
    def lt({:card, :diamond, _}, {:card, :spade, _}) do true end
    def lt({:card, :heart, _}, {:card, :spade, _}) do true end
    def lt({:card, _, _}, {:card, _, _}) do false end

    def split(lst) do split(lst, [], []) end
    def split([ ], a, b) do {a, b} end
    def split([h|t], a, b) do split(t, b, [h|a]) end

    def sort([ ]) do [ ] end
    def sort([e]) do [e] end
    def sort([h|t]) do
        
    end

end