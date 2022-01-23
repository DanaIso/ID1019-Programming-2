defmodule Test do
    
    def revrs(lst) do revrs(lst, [ ]) end
    def revrs([ ], acc) do acc end
    def revrs([h|t], acc) do
        revrs(t, [h|acc])
    end

end