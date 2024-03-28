def calculate_fuel(mass, flight_route)
    total_fuel = 0
    flight_route.each_with_index do |(directive, gravity), index|
        if directive == :launch
            fuel = (mass * gravity * 0.042 - 33).floor
        elsif directive == :land
            fuel = (mass * gravity * 0.033 - 42).floor
            if gravity == 1.62  # Check if landing on the Moon
                additional_fuel = calculate_additional_fuel(mass, index, flight_route)
                fuel += additional_fuel
            end
        end
        total_fuel += fuel
        mass += fuel
    end
    total_fuel
end

def calculate_additional_fuel(mass, current_index, flight_route)
    additional_fuel = 0
    (0...current_index).reverse_each do |i|
        directive, gravity = flight_route[i]
        if directive == :launch
            additional_fuel += (mass * gravity * 0.042 - 33).floor
        end
    end
    additional_fuel
end

# Test the function with provided example
mass = 28801
flight_route = [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]
total_fuel_required = calculate_fuel(mass, flight_route)
puts "Total fuel required: #{total_fuel_required}"
