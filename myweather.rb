require 'barometer'

def weather_forecaster(location)
  Barometer.new(location).measure
end

puts "Please enter your postal or zip code."
location = gets.chomp
# location = "k7k 5z5"
# puts "what is the date? Use dd/mm/yyyy"
# date = gets.chomp
today = Time.now.to_s

date = Date.parse (today)
mydate = date.strftime("%B %d, %Y")
myicon = ""
myhigh = ""
mylow =""
weather = weather_forecaster(location)
puts "The current weather in #{location} is #{weather.current.icon}"
puts "With a temperature of #{weather.current.temperature}."
puts "The weather for the week beginning #{mydate} is as follows:"
  mydate = date.strftime("%A")
weather.forecast.each do |forecast|
  date = forecast.starts_at
  myicon = forecast.icon
  high = forecast.high.c
  low = forecast.low.c

  puts "Weather for #{mydate} is #{myicon} with a high of #{high}C and a low of #{low}C."
  date = date + 1
  mydate = date.strftime("%A")
end

# puts "Tomorrow the weather will be #{weather.tomorrow.icon}"
# puts "Hello"
# puts "The weather for the next 7 days will be:"
# begin
#   date = date +1
#   counter =counter + 1
#   puts "#{date}: #{weather.for(date)}"
# end until counter == 5
# # puts  #{date+1} will be #{weather.forecast.for(date)}"
