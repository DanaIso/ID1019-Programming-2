defmodule Vector do
    
    def smul({x1, x2, x3}, s) do
        {x1*s, x2*s, x3*s}
    end

    def add({x1, x2, x3}, {y1, y2, y3}) do
        {x1+y1, x2+y2, x3+y3}
    end

    def sub({x1, x2, x3}, {y1, y2, y3}) do
        {x1-y1, x2-y2, x3-y3}
    end

    def norm({x1, x2, x3}) do
        :math.sqrt(x1*x1 + x2*x2 + x3*x3)
    end

    def dot({x1, x2, x3}, {y1, y2, y3}) do
        x1*y1 + x2*y2 + x3*y3
    end

    def normalize(x) do
        n = norm(x)
        smul(x, 1/n)
    end

    # Square of a vector.
    def sq(x) do
        dot(x, x)
    end

    # The norm (length) of a vector.
    def norm({x1, x2, x3}) do
        :math.sqrt(x1 * x1 + x2 * x2 + x3 * x3)
    end

    # Cross product, used to find a vector that as ortogonal to 
    # both x and y.
    def cross({x1, x2, x3}, {y1, y2, y3}) do
        {x2 * y3 - x3 * y2, x3 * y1 - x1 * y3, x1 * y2 - x2 * y1}
    end

end