require_relative "planet"
require_relative "solar_system"

def main
  untenable = SolarSystem.new("Untenable")
  earth = Planet.new(name: "Earth", color: "blue-green", mass_kg: 5.972e24, distance_from_sun_km: 1.496e8, fun_fact: "Only planet known to support life")
  venus = Planet.new(name: "Venus", color: "white", mass_kg: 4.867e24, distance_from_sun_km: 1.0826e8, fun_fact: "Venus is the only planet in the Solar System to be named after a female figure.")
  exploder = Planet.new(name: "Exploder", color: "fire", mass_kg: 1.847e26, distance_from_sun_km: 1.0826e5, fun_fact: "Exploder is too close to the Sun. It is going to explode.")
  untenable.add_planet(earth)
  untenable.add_planet(venus)
  untenable.add_planet(exploder)

  user_input = nil
  puts "Hey user, what do you want to do? 
  (please type 'list' to list the planets, 'details' to show planet information,  or 'exit' to leave the program"
  user_input = gets.chomp.downcase
  until user_input == "exit"
    if user_input == "list"
      list = untenable.list_planets
      puts list
      puts "What do you wanna do next? (Please type 'list' to list the planets, 'details' to show planet information, or 'exit' to leave the program"
    elsif user_input == "details"
      puts "Which planet do you want to learn more about?"
      puts untenable.list_planets
      planet_select = gets.chomp.downcase
      planet = untenable.find_planet_by_name(planet_select)
      while planet == nil
        puts "Please enter a REAL planet name. Select from the list."
        puts untenable.list_planets
        planet_select = gets.chomp.downcase
        planet = untenable.find_planet_by_name(planet_select)
      end
      puts planet.summary
      puts "What do you wanna do next? (Please type 'list' to list the planets, 'details' to show planet information, or 'exit' to leave the program"
    else
      puts "INVALID INPUT. Please enter 'list' or 'exit'."
    end

    user_input = gets.chomp.downcase
  end
end

main
