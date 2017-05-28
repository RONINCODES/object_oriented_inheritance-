require 'httparty'
require 'json'



# This class represents a world traveller who knows what languages are spoken in each country
# around the world and can cobble together a sentence in most of them (but not very well)
class Multilinguist

  TRANSLTR_BASE_URL = "http://www.transltr.org/api/translate"
  COUNTRIES_BASE_URL = "https://restcountries.eu/rest/v2/name"
  #{name}?fullText=true
  #?text=The%20total%20is%2020485&to=ja&from=en


  # Initializes the multilinguist's @current_lang to 'en'
  #
  # @return [Multilinguist] A new instance of Multilinguist
  def initialize
    @current_lang = 'en'
  end

  # Uses the RestCountries API to look up one of the languages
  # spoken in a given country
  #
  # @param country_name [String] The full name of a country
  # @return [String] A 2 letter iso639_1 language code
  def language_in(country_name)
    params = {query: {fullText: 'true'}}
    response = HTTParty.get("#{COUNTRIES_BASE_URL}/#{country_name}", params)
    json_response = JSON.parse(response.body)
    json_response.first['languages'].first['iso639_1']
  end

  # Sets @current_lang to one of the languages spoken
  # in a given country
  #
  # @param country_name [String] The full name of a country
  # @return [String] The new value of @current_lang as a 2 letter iso639_1 code
  def travel_to(country_name)
    local_lang = language_in(country_name)
    @current_lang = local_lang
  end

  # (Roughly) translates msg into @current_lang using the Transltr API
  #
  # @param msg [String] A message to be translated
  # @return [String] A rough translation of msg
  def say_in_local_language(msg)
    params = {query: {text: msg, to: @current_lang, from: 'en'}}
    response = HTTParty.get(TRANSLTR_BASE_URL, params)
    json_response = JSON.parse(response.body)
    json_response['translationText']
  end
end

class Math_genius < Multilinguist


  def report_total(value)
    total = 0
     value.each do |number|
      total += number
    end
    say_in_local_language("The Total is #{total}")
  end

  def get_pide(number)
    pi = 3.1416
    number * pi
  end
end


class QuoteDude < Multilinguist


  @@collection_of_quotes = []

  def add_quote(quote)
    @@collection_of_quotes << quote
  end

  def self.all
    puts @@collection_of_quotes
  end

  def random_quote_in_local_language(country, random = @@collection_of_quotes.sample)
    p travel_to(country)
    return say_in_local_language(random)
  end
end


class Vagabond < Multilinguist
end

















########################End of CLASS##################################
#bob = Multilinguist.new #instantialize an instance of the Multilinguist class. Storing within variable 'bob'.
#bob.travel_to("Italy") #utilizing instance variable travel_to on
                        #bob' my multinguist - and pased the arguement ("Italy") - the return value was
                        # "it" - therefore setting the local language to Italian.

 #puts bob.say_in_local_language("it's a me, Mario")  #utilized say_in_local_language instance method on my multilinguist 'bob'.
                                                #passed a message argument - in english as a a string ("It's a me, Mario")
                                                #the return value is #=> "Un suo mi Mario" (aka bad italian translation :)

#jane = Math_genius.new    #instantialized and instance of Math_genius and saved the instance in a variable called 'jane'
                          #Math_genius is a child class of Multilinguist - and therefore inherits all the methods avaialble to its parents class.
                          #Therefore jane is both a Math_genius and a Multilinguist
#jane.travel_to("Italy")
#puts jane.report_total([1,2,3,4,5,])

# numbers = [1,2,3]
# me = Math_genius.new
# puts me.report_total(numbers)

me = Math_genius.new

puts me.report_total([1,2,3])

me.travel_to("Japan")

puts me.report_total([2,3,2])

me.travel_to("China")

puts me.get_pide(8)  #How do I make this work with multiple arguments.


me2 = QuoteDude.new
me2.add_quote("Just Do It")
me2.add_quote("Don't shoot messengers")
me2.add_quote("holy cow man")

puts me2.random_quote_in_local_language("italy")

puts QuoteDude.all

me3 = Vagabond.new
me3.travel_to("Canada")
