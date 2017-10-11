require_relative 'lib/security_code'

puts 'Welcome to security bathroom code decryptor!'
puts 'Please copy-paste your text document inside movements.txt *jumping lines included and press enter'
gets.chomp
puts 'Here is your bathroom code :'
document = File.read('movements.txt')
puts '=========='
SecurityCode.password_code(document).first.each do |digit|
  print " #{digit} "
end
puts
puts '=========='
puts 'Thanks for using security_code! Press enter to exit'
gets.chomp
