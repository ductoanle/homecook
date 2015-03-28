object @orders
attributes :id, :quantity, :status, :total
child(:buyer){attributes :id, :username}
child(:dish) do
  attributes :id, :name
  child(:images){attributes :name}
end
child(:place){attributes :id, :address, :timeslot}
