defprotocol Object do
  
    def intersect(object, ray) do
        
        List.foldl(objects, {:inf, nil}, 
            fn (object sofar) -> {dist, _} = sofar
            
                case Object.intersect(object, ray) do
                    {:ok, d} when d < dist -> {d, object}
                    _ -> sofar
                end
            end)

    end

end