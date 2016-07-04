class CreateTravelMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_methods do |t|
      t.string :name, null: false
      t.string :description, null: false
    end

    # Travel Methods as defined by the GTFS
    execute "insert into travel_methods(id, name, description) values(0, 'Tram, Streetcar, Light rail', 'Any light rail or street level system within a metropolitan area.');"
    execute "insert into travel_methods(id, name, description) values(1, 'Subway, Metro', 'Any underground rail system within a metropolitan area.');"
    execute "insert into travel_methods(id, name, description) values(2, 'Rail', 'Used for intercity or long-distance travel.');"
    execute "insert into travel_methods(id, name, description) values(3, 'Bus', 'Used for short- and long-distance bus routes.');"
    execute "insert into travel_methods(id, name, description) values(4, 'Ferry', 'Used for short- and long-distance boat service.');"
    execute "insert into travel_methods(id, name, description) values(5, 'Cable car', 'Used for street-level cable cars where the cable runs beneath the car.');"
    execute "insert into travel_methods(id, name, description) values(6, 'Gondola, Suspended cable car', 'Typically used for aerial cable cars where the car is suspended from the cable.');"
    execute "insert into travel_methods(id, name, description) values(7, 'Funicular', 'Any rail system designed for steep inclines.');"
    execute "insert into travel_methods(id, name, description) values(8, 'Car', 'Personal vehicle.');"
    execute "insert into travel_methods(id, name, description) values(9, 'Bike', 'Personal Bike.');"
  end
end
