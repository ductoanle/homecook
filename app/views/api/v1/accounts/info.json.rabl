object @kitchen
attributes :name, :description
child(:category){attributes :name}
child(:owner) { attributes :id, :username, :email }
