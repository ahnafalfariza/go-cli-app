require_relative 'gocli.rb'
require_relative 'driver.rb'
require_relative 'history.rb'
require_relative 'user.rb'

#for calling class go-cli, this take parameters whether filename, three parameters, or no parameters
# 3 parameters
#  gocli = Gocli.new(15,10,8)

# no parameters
#  gocli = Gocli.new("input")

# no parameters
gocli = Gocli.new()

#to get the map
map = gocli.arr

#call user class
user = User.new()
init = user.find_user(map)

#call driver class
driver = Driver.new

#call history class
history = History.new

puts "\nWELCOME TO GO-CLI APP"
puts "Your Smart CLI App"

loop do
  #option in the app
  puts "\nMain menu"
  puts "1. Show Map"
  puts "2. Order Go-Ride"
  puts "3. Show History"
  puts "4. Exit"

  print "\nYour input: "
  input=gets.chomp.to_i

  case input
  when 1
    #show map
    gocli.show_map(map)

  when 2
    puts "Where do you want to go?"
    puts "you are in position #{init.map{|x|x+1}}"
    x_dest=-1
    y_dest=-1

    #input dest x
    loop do
      print " x: "
      x_dest=gets.to_i
      if x_dest>0 && x_dest<=map.length
        break
      else
        puts "The range number is in range 1 and #{map.length}"
      end
    end

    #input dest y
    loop do
      print " y: "
      y_dest=gets.to_i
      if y_dest>0 && y_dest<=map.length
        break
      else
        puts "The range number is in range 1 and #{map.length}"
      end
    end

    #destination coordinate
    dest = [x_dest-1,y_dest-1]

    if dest != init
      #gets the nearest driver and its position
      nearest_driver = driver.nearest_driver(map,init)
      nearest_driver_name = driver.nearest_driver_name(nearest_driver)

      #print driver name, driver position, route, and estimate price
      puts "\nYour nearest driver is #{nearest_driver_name} at position #{nearest_driver.map{|x| x+1}} "
      puts driver.route_go_ride(init,dest)
      puts driver.estimate_price(init,dest)

      print "\nDo you want to continue? (y/n) "
      loop do
        input = gets.chomp.to_s
        if input=="Y" || input=="y"
          puts "\nYou traveled to #{dest.map{|x|x+1}}"
          puts "Your order is completed"
          puts

          #get receipt and print
          receipt = driver.print_receipt(init.map{|x| x+1}, dest.map{|x| x+1}, nearest_driver.map{|x| x+1}, nearest_driver_name)
          puts receipt

          #write receipt to file
          File.write('receipt', receipt+"\n")

          #add receipt to history
          history.add_history(receipt)

          #update the map and position
          map = gocli.generate_map(map.length, dest[0], dest[1])
          init = dest

          break
        elsif input=="N" || input=="n"
          break
        else
          puts "Please enter the correct input"
        end

      end

      else puts "Your destination is same as your current position"

    end

  when 3
    #show history of order
    history.show_history

  when 4
    #exit app
    puts "Goodbye!"
    break

  else
    puts "You input wrong option"
  end

end