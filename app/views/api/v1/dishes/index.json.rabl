object @dishes
attributes :id, :name, :price, :quantity, :category, :last_order
child(:owner => :owner) do
  attributes :id, :username
  child(:images){attributes :name}
end
child(:places){attributes :id, :address, :timeslot}
