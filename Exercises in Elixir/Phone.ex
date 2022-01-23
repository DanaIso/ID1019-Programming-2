defmodule Phone do
    
    def p2() do
        {:phone, "iPhone", 
        %{:model => "12 Pro", :memory => 128, :color => "White"}}
    end

    def phone_brand_model_2( {:phone, brand, prop} ) do
        case prop do
            %{:model => mod} -> "#{brand} #{mod}"
            _ -> brand
        end
    end
    
    
    
    defstruct brand: "no info", model: "no info", memory: :na, color: "no info"

    def p1() do
        %Phone{:brand => "Samsung", :model => "Galaxy S21", :memory => 64, :color => "Black"}
    end

    def phone_brand_model_1(%Phone{brand: br, model: mod}) do
        "#{br} #{mod}"
    end

    def phone_all1(%Phone{brand: br, model: mod, memory: mem, color: col}) do
        "#{br} #{mod} #{mem} #{col}"
    end

    def memory(phone = %Phone{}) do
        phone.memory
    end

    def works(phone) do
        phone.memory
    end

end