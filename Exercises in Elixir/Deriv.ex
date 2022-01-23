defmodule Deriv do
    
    @type literal() :: {:num, number()} | {:var, atom()}
    @type expr() :: literal() | {:add, expr(), expr()} | {:mul, expr(), expr()} | {:exp, expr(), literal()}


    def test() do 
        e = {:add, {:mul, {:num, 2}, {:var, :x}}, {:num, 4}}
        d = deriv(e, :x)
        IO.write("Expression: #{pprint(e)}\n")
        IO.write("Derivative: #{pprint(d)}\n")
        :ok
    end


    def deriv({:num, _}, _) do {:num, 0} end
    def deriv({:var, v}, v) do {:num, 1} end
    def deriv({:var, _}, _) do {:num, 0} end
    def deriv({:add, e1, e2}, v) do {:add, deriv(e1, v), deriv(e2, v)} end
    def deriv({:mul, e1, e2}, v) do {:add, {:mul, deriv(e1, v), e2}, {:mul, e1, deriv(e2, v)}} end
    

    def pprint({:num, n}) do "#{n}" end
    def pprint({:var, v}) do "#{v}" end
    def pprint({:add, e1, e2}) do "(#{pprint(e1)} + #{pprint(e2)})" end
    def pprint({:mul, e1, e2}) do "#{pprint(e1)} * #{pprint(e2)}" end

end