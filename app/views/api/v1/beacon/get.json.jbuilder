json.store do

  json.extract! @menu.store, :id, :name, :address

  json.menu do
    json.extract! @menu, :name, :description
    json.items @menu.items, :id, :name, :description, :price
  end

end


