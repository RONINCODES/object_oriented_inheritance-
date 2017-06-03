############SolarSystem#######################



############Class System#######################

class System

require_relative 'celestial_bodies.rb'  # linking Class body (found in celestial_bodies.rb) to solar_system.rb

attr_reader :bodies
@@bodies = []


#################Class Methods#############################
  def self.all   #class method that displays all objects within class variable @@bodies where added bodies are stored
    @@bodies
  end

  def self.create   #class method creates and saves new instance of System class.
    System.new
  end

##################Instance Methods#########################
  def add(body)
    @@bodies << body
    #adds celestial body to the list
  end

  def total_mass  #adds up all the mass of all the bodies in the @@bodies list
    mass = []
    @@bodies.each do |celestial_body|
    mass << planet.mass
   end
   return mass.sum
 end

end


###########################End Of Class####################
milkyway = System.create

naboo = Planet.new("Naboo", 5000, 5, 3)
milkyway.add_bodies(naboo)

alderaan = Planet.new("Alderaan", 7500, 18, 13)
milkyway.add_bodies(alderaan)

jedha = Planet.new("Jedha", 400, 4, 3)
milkyway.add_bodies(earth)

sunshine = Star.new("Sunshine", 5000, "G-Type")
milkyway.add_bodies(sunshine)

sun = Star.new("Sun", 4000, "G-Type")
milkyway.add_bodies(sun)

heleos = Star.new("Heleos", 4500, "G-Type")
milkyway.add_bodies(star3)

luna = Moon.new("Luna", 2, 1, "Jedha")
milkyway.add_bodies(luna)

endor = Moon.new("Endor", 1, 3, "Naboo")
milkyway.add_bodies(endor)

puts milkyway.total_mass
