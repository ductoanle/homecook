object @dish
attributes :id, :name, :price, :quantity, :category, :last_order, :description
child(:owner => :owner){attributes :id, :username}
child(:places){attributes :id, :address, :timeslot}
child(:images){attributes :name}

