class Driver

  require_relative 'gocli.rb'

  attr_accessor :total_pay

  @driver_name
  @driver_pos
  @total_pay

  def initialize()
    @driver_name = ["Andi", "Bobi", "Chris", "Doni", "Eko"].shuffle     #list of driver name
    @total_pay = 0    #total user must pay
  end

  #method for find the nearest driver from the user,
  # it needs two parameters, user coordinate and map
  def nearest_driver(map,user)
    driver_pos=[]

    for i in 0..map.length-1
      for j in 0..map.length-1
        if map[i][j] == " D "
          driver_pos << [i,j]
        end
      end
    end
    @driver_pos=driver_pos

    nearest_driver_position = driver_pos[0]
    distance = driver_pos[0].zip(user).map { |x| x.reduce(:-).abs }.sum

    for i in 1..driver_pos.length-1
      temp = driver_pos[i].zip(user).map { |x| x.reduce(:-).abs }.sum
      if temp < distance
        distance = temp
        nearest_driver_position = driver_pos[i]
      end
    end
    nearest_driver_position
  end

  #method for recognize the driver's name with the driver coordinate
  def nearest_driver_name(pos)
    a = @driver_pos.find_index(pos)
    @driver_name[a]
  end

  #method for count the estimate price, the parameters are initial coordinate and destination coordinate
  def estimate_price(from, dest)
    distance = from.zip(dest).map { |x| x.reduce(:-).abs }.sum
    @total_pay = distance * 300
    "Distance : #{distance}\nThe price is #{total_pay}"
  end

  #method for show the route of the trip, the parameters are initial coordinate and destination coordinate
  def route_go_ride(from, dest)
    from = from.map{|x|x+1}
    dest = dest.map{|x|x+1}

    x=from[0]
    y=from[1]

    route = "The route is\n\tstart at (#{x},#{y})"

    if from[0]!=dest[0]
      if from[0]<dest[0]
        until x == dest[0]
          x = x + 1
        end
        route += "\n\tgo to (#{x},#{y})"
        route += "\n\tturn right" if y>dest[1]
        route += "\n\tturn left" if y<dest[1]

      else from[0]>dest[0]
        until x == dest[0]
          x = x - 1
        end
      route += "\n\tgo to (#{x},#{y})"
      route += "\n\tturn left" if y>dest[1]
      route += "\n\tturn right" if y<dest[1]
      end
    end

    if from[1]!=dest[1]
      if from[1]<dest[1]
        until y == dest[1]
          y = y + 1
        end
        route += "\n\tgo to (#{x},#{y})"
      else from[1]>dest[1]
        until y == dest[1]
          y = y - 1
        end
      route += "\n\tgo to (#{x},#{y})"
      end
    end

    route += "\n\tfinish at (#{x},#{y})"
    route

  end

  #method for print receipt
  def print_receipt(user_loc, dest_loc, driver_loc, driver_name)
    receipt = "RECEIPT GO-RIDE\n Thank you for using Go-Ride\n From #{user_loc} to #{dest_loc}\n Driver name #{driver_name} from location #{driver_loc}\n "
    receipt += route_go_ride(user_loc,dest_loc)
    receipt += "\n "
    receipt += estimate_price(user_loc,dest_loc)
    receipt
  end

end