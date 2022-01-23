defmodule Types do
    
    @type person() :: {:person, integer(), binary(), binary()}

    def test() do
        pers1 = {:person, 20, "Pelle", "Svensson"}
        hello(pers1)
    end

    def hello({:person, _, name, _}) do
        IO.write("Hello #{name}\n")
    end

end