



############Require#########################


############Class Body#######################

class Body

attr_reader :name, :mass

################initialize##########################


  def initialize(name, mass)
    @name = name
    @mass = mass
  end

end
###########################End of Body Class####################

##############Begining Child Classes-Planets, Stars, Moons##################

# Have a day, which is the number of hours it takes for the planet to rotate all the way around once.
# Have a year, which is the number of days it takes for the planet to orbit the sun once.
# Whether you want to express this in Earth days or the planet's days is up to you.

  class Planet < Body


    def initialize(name, mass, day, year)
      super(name, mass)   #use super because this chicld class is inheriting arguments(name and mass) from parent class Body.
      @day = day
      @year = year
   end

end

# Have a type (ie. our Sun is a G-type star)

  class Star < Body

    def initialize(name, mass, day, year)
      super(name, mass)
      @type = type   #our sun's type is G-type
    end

  end

  # Have a month, which is the number of days it takes for the moon to orbit its planet. Again, this can either be Earth days or the planet's days, your choice.
  # Have a planet that they orbit. We want to store the whole Planet object here.


  class Moon < Body

    def initialize(name, mass, month)
      super(name, mass)
      @month = month #this is the number of days it takes for the moon to orbit its planet (earth days)
      @planet = planet  # store the Planet object in this array
    end

  end
  
###########################End of Class###################
earth
