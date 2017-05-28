#Create a file called people.rb. Run your program and commit your work after each step.

#Let's start by creating two classes: one called Student and another called Instructor.
#The student class has a method called learn that outputs "I get it!".
#The instructor class has a method called teach that outputs "Everything in Ruby is an Object".
#Both the instructor and the student have names. We know that instructors and students are both people. Create a parent Person class that contains the attribute name and an initializer to set the name.
#Both the instructor and the student should also be able to do a greeting, like "Hi, my name is #{name}". Where's the best place to put this common method?
#Create an instance of Instructor whose name is "Chris" and call his greeting.
#Create an instance of Student whose name is "Cristina" and call her greeting.
#Call the teach method on your instructor instance and call the learn method on your student. Next, call the teach method on your student instance. What happens? Why doesn't that work? Leave a comment in your program explaining why.
#Once you're done, commit and push your work to GitHub!


class Person

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi my name is #{@name}."
  end
end

class Student < Person





  def learn
    puts "I get it"
  end
end


class Instructor < Person

  def teach
    puts "Everything in Ruby is an Object"
  end
end


chris = Instructor.new("Chris")
cristina = Student.new("Cristina")

chris.greeting
cristina.greeting

chris.teach
cristina.learn

cristina.teach  # Because Cristina is not an instructor she is not able to teach.
                  #While Chris and Cristina are peope, the teach instance method is is specific to the instructor class
