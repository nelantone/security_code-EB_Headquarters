require_relative 'lib/security_code'
movements_file_path = File.expand_path("../movements.txt", __FILE__)

puts 'Welcome to security bathroom code decryptor!'
puts 'Please copy-paste your text document inside movements.txt *jumping lines included and press enter'
gets.chomp
puts 'Here is your bathroom code :'
document = File.read(movements_file_path)
puts '=========='
SecurityCode.password_decoder(document).each do |digit|
  print " #{digit} "
end
puts
puts '=========='
puts 'Thanks for using security_code! Press enter to exit'
gets.chomp
