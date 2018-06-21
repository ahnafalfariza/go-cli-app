class Gocli

  attr_accessor :arr

  #to executing the go_cli_app we can have 3 options
  # 1. With 3 parameters n,x,y
  # 2. With 1 parameters, the parameter is the file name
  # 3. With no parameters, this will be make n to 20 and the x,y will be randomized
  def initialize(*args)
    if args.length==3
      n = args[0]
      x = args[1]-1
      y = args[2]-1
      arr = generate_map(n,x,y)

    elsif args.length==0
      n=20
      x = rand(n)
      y = rand(n)
      arr = generate_map(n,x,y)

    elsif args.length == 1 && args[0].is_a?(String)
      arr = generate_map_file(args)

    else
      arr=[]

    end

    @arr=arr

  end

  #method for generate the map with parameters n,x,y
  # n = map size
  # x = coordinate user
  # y = coordinate user
  def generate_map (n, x, y)
    arr = Array.new(n) { Array.new(n, " . " ) }
    arr[x][y] = " U "
    i=0
    until i==5
      x = rand(n)
      y = rand(n)
      if arr[x][y] == " . "
        arr[x][y] = " D "
        i+=1
      end
    end
    @arr=arr
    arr
  end

  #method for generate the map from a file
  def generate_map_file (file)
    (File.read "input").split("\n").map{|x| x.split("").map {|y| " " + y + " "}}
  end

  #method for print the map
  def show_map(map)
    if(!map.empty?)
      map.each do |x|
        x.each do |y|
          print y
        end
        puts
      end
    end
  end

end