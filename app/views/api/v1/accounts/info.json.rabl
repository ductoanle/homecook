object @account
attributes :name
child(:owner) { attributes :id, :username, :email }
