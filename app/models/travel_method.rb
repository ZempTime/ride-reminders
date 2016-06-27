class TravelMethod

  def self.all
    [
      {uid: 0, name: "Tram, Streetcar, Light rail", description: "Any light rail or street level system within a metropolitan area." },
      {uid: 1, name: "Subway, Metro", description: "Any underground rail system within a metropolitan area."},
      {uid: 2, name: "Rail", description: "Used for intercity or long-distance travel."},
      {uid: 3, name: "Bus", description: "Used for short- and long-distance bus routes."},
      {uid: 4, name: "Ferry", description: "Used for short- and long-distance boat service."},
      {uid: 5, name: "Cable car", description: "Used for street-level cable cars where the cable runs beneath the car."},
      {uid: 6, name: "Gondola, Suspended cable car", description: "Typically used for aerial cable cars where the car is suspended from the cable."},
      {uid: 7, name: "Funicular", description: "Any rail system designed for steep inclines." },
      {uid: 8, name: "Car", description: "Personal vehicle."},
      {uid: 9, name: "Bike", description: "Personal bike."}
    ]
  end

  def self.options
    all.map { |option| [option[:name], option[:uid]] }
  end
end
