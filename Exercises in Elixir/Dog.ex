defmodule Dog do
    
    defstruct name: "Fido", year: 2020

    def karo() do
        %Dog{name: "Karo"}
    end

end