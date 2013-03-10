require './lib/field'
require './lib/Cellar'

field=Field.new 10  #памер поля
field.draw
puts "'f' to exit"
until gets.chomp=='f'
  field.nextPos
  field.draw
  puts "'f' to exit"
end