object @order
attributes :quantity, :status, :total
child(:buyer){attributes :id, :username}
child(:dish){attributes :id, :name}
child(:place){attributes :id, :address, :timeslot}
