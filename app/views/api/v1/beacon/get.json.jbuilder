json.store do

  json.extract! @menu.store, :id, :name, :address

  json.loyalty_programs @menu.store.loyalty_programs, :id, :s_type, :item_or_menu_name, :s_required, :s_discount

  json.menu do
    json.extract! @menu, :name, :description
    json.items @menu.items, :id, :name, :description, :price
  end

end


