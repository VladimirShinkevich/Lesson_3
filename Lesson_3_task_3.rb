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
    return if @current_station == end_station  
    station_index = route.show_route.index(@current_station) 
    @current_station = route.show_route[station_index + 1]
  end
  
  def prev_station
    return if @current_station >=0
    station_index = route.show_route.index(@current_station)
    @current_station = route.show_route[station_index - 1]
  end      

  def train_moving_next
    return unless next_station
    @current_station.train_send(self)
    @current_station = next_station
    @current_station.train_arrived(self)
  end

  def train_moving_prev
    return unless prev_station
    @current_station.train_send(self)
    @current_station = prev_station
    @current_station.train_arrived(self)
  end

end
