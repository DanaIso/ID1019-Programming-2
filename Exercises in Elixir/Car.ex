defmodule Car do
    
    def a1() do
        {:car, "Volvo",
            {:model, "XC60", 2018},
            {:color, "blue"},
            {:engine, "A4", 4, 2000, 140},
            {:perf, 4.6, 8.8}}
    end

    def car_brand_model_1({:car, brand, {:model, model, _}, _, _, _}) do
        "#{brand} #{model}"
    end



    def a2() do
        {:car, "VW", 
            [{:model, "Typ-1"}, {:year, 1964}, {:engine, "1300"},
             {:cyl, 4}, {:vol, 1300}, {:color, "blue"}, {:power, 40}, 
             {:fuel, 4.6}, {:acc, 12.8}]}
    end

    def car_brand_model_2({:car, brand, prop}) do
        case List.keyfind(prop, :model, 0) do
            nil -> brand
            {:model, model} -> "#{brand} #{model}"
        end
    end



    def a3() do
        {:car, "VW",
        %{:model => "Typ-1", :year => 1964, :engine => "1300",
        :cyl => 4, :vol => 1300, :power => 40,
        :fuel => 4.6, :acc => 12.8}}
    end

    def car_brand_model_3( {:car, brand, prop} ) do
        case prop do
            %{:model => model} -> "#{brand} #{model}"
            _ -> brand
        end
    end



    defstruct brand: "", year: :na, model: "unknown", cyl: :na, power: :na

    def a4() do
        %Car{:brand => "SAAB", :model => "96 V4", :year => 1974, :power => 65, :cyl => 4}
    end

    def car_brand_model_4( %Car{brand: brand, model: model} ) do
        "#{brand} #{model}"
    end

    def year( car = %Car{} ) do
        car.year
    end

    def works(car) do
        car.year
    end

    def wrong() do
        year(:bananas)
    end

end