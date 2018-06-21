class User
  def initialize

  end

  #This method is for finding the position of the user
  def find_user (map)
    user = []
    for i in 0..map.length-1
      for j in 0..map.length-1
        if map[i][j] == " U "
          user = [i,j]
        end
      end
    end
    user
  end


end