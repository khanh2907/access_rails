json.extract! @menu, :store_id, :id, :name, :description

json.items @menu.items, :id, :name, :description, :price
