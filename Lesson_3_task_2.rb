class Route
  attr_accessor :starting_station, :end_station, :intermediate_station

  def initialize(starting_station, end_station)
    @starting_station = starting_station
    @end_station = end_station
    @intermediate_station = []
  end

  def add_intermediate_station(station)
    @intermediate_station << station
  end

  def delete_intermediate_station
    @intermediate_station.delete(station)
  end

  def show_route
   [@starting_station] + @intermediate_station + [@end_station]
  end
end
