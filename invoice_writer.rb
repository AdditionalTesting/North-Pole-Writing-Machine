require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/invoice_letter_template.txt.erb')
EXPENSIVE_TOY = 1000
CHEAP_TOY = 100

kids_data.each_line do |kid|

 kid_data_array = kid.split

 name          = kid_data_array[0]
 behavior      = kid_data_array[2]
 toys          = kid_data_array[3..8]
 street_number = kid_data_array[9]
 street_name   = kid_data_array[10]
 street_suffix = kid_data_array[11]
 postal_code   = kid_data_array[12]
 house_value   = kid_data_array[13]

  nice_kid_total = 0
if behaviour == 'nice'
  if house_value > 1000000
    nice_kid_total = toys * EXPENSIVE_TOY
  elsif house_value > 200000
    nice_kid_total = toys * CHEAP_TOY
  elsif house_value < 200000
    nice_kid_total = 0
  end
elsif behaviour == "naughty"
  if house_value > 1000000
    nice_kid_total = EXPENSIVE_TOY
  elsif house_value > 200000
    nice_kid_total = CHEAP_TOY
  elsif house_value < 200000
    nice_kid_total = 0
  end
end
  






  filename    = 'letters/invoices' + name + '.txt'
  letter_text = ERB.new(invoice_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
