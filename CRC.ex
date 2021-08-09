defmodule CRC do
    def compute([]) do [] end
    def compute(lst) do 
        l = lst++[0,0,0]
        central(l)
    end

    def central(lst) do
        case lst do
            [e1, e2, e3] -> [e1, e2, e3]
            [0|t] -> central(t)
            lst -> check(lst, [1,0,1,1], [])
        end
    end
    
    def check([], _, acc) do central(Enum.reverse(acc)) end
    def check([h|t], [g|r], acc) do 
        cond do
            h == g -> check(t, r, [0|acc])
            h != g -> check(t, r, [1|acc])
        end
    end
    def check([h|t], [], acc) do check(t, [], [h|acc]) end
end