class Train
  attr_reader :size, :speed, :current_station, :route

  def initialize(number, type, vagons)
    @number = number
    @type = type
    @vagons = vagons
  end

  def go
    @speed = 50
  end

  def stop
    @speed = 0
  end

  def add_vagon
    if @speed == 0
      @vagons += 1
    else
      puts "You can't do this, your speed = #{@speed}!!!"
    end
  end

  def delete_vagon
    until vagons == 0
      if @speed == 0
        @vagons -= 1
      else
        puts "You can't do this, your speed = #{@speed}!!!"
      end
    end
  end

  def train_route(route)
    @route = route
    @current_station = route.starting_station
  end
  
  def next_station
    station_index = route.show_route.index(@current_station) 
    if(station_index + 1) != route.show_route.size.size
      @current_station = route.show_route[station_index + 1]
    else
      @current_station == nil
      puts "You have arrived at the terminal station"
    end  
  end
  
  def prev_station
    station_index = route.show_route.index(@current_station)
    if (station_index - 1) >= 0
      @current_station = route.show_route[station_index - 1]
    else
       @current_station == nil
      puts "You are at the starting station!"
    end
  end      

  def train_moving_next
    next_station 
  end

  def train_moving_prev
    prev_station
  end

end
