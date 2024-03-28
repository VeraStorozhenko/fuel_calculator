This code is writng using Ruby 
and resolves the following task

Backend Test Task                 

Congratulations! You have received a contract from NASA for a software application that will help to calculate the fuel required for the flight. This application aims to calculate fuel to launch from one planet of the solar system and land on another planet of the solar system, depending on the flight route.

The formula to calculate fuel is quite simple, but it depends on the planet's gravity. Planets NASA is interested in are:

Earth - 9.807 m/s2
Moon - 1.62 m/s2
Mars - 3.711 m/s2

The formula for fuel calculations for the launch is the following:

mass * gravity * 0.042 - 33 rounded down

The formula for fuel calculations for the landing is the following:

mass * gravity * 0.033 - 42 rounded down

For example, for the Apollo 11 Command and Service Module, with a weight of 28801 kg, to land it on Earth, the required amount of fuel will be:

28801 * 9.807 * 0.033 - 42 = 9278
However, fuel adds weight to the ship, so it requires additional fuel until the additional fuel is 0 or negative. Additional fuel is calculated using the same formula from above.

9278 fuel requires 2960 more fuel
2960 fuel requires 915 more fuel
915 fuel requires 254 more fuel
254 fuel requires 40 more fuel
40 fuel requires no more fuel

So, to land Apollo 11 CSM on the Earth, 13447 fuel is required (9278 + 2960 + 915 + 254 + 40).

The application should receive a flight route as 2 arguments. The first one is the flight ship mass, and the second is an array/list of 2 element tuples, with the first element being land or launch directive, and the second element is the target planet gravity.

But consider that to land a module on the Moon, you need additional fuel, which should be launched from the Earth - we don’t have a refuel station in space - and we need to carry fuel for all steps from the beginning. 

For example, for the program to launch the ship from the Earth, land it on the Moon, and return to the Earth, input arguments will look like this:

Ruby - 28801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]
Elixir - 28801, [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 9.807}]
Python - 28801, [(:launch, 9.807), (:land, 1.62), (:launch, 1.62), (:land, 9.807)]

