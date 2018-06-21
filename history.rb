class History

  @arr

  def initialize()
    @arr=[]
  end

  #method for add history of transaction
  def add_history(str)
    @arr << str
  end

  #method for print transaction history
  def show_history()
    if !@arr.empty?
      i=1
      puts "History"
      @arr.each do |hist|
        puts "#{i}. #{hist}"
        puts "\n"
        i+=1
      end
    else
      puts "You dont have any history yet "
    end
  end

end
