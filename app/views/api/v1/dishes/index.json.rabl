object @dishes
attributes :id, :name, :price, :quantity, :category, :last_order
child(:owner => :owner){attributes :id, :username}
child(:places){attributes :address, :timeslot}
