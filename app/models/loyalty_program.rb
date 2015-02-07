class LoyaltyProgram < ActiveRecord::Base
  enum s_type: [:item, :menu]
  belongs_to :store
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :s_required
  validates_presence_of :s_discount

  def item_or_menu_name
    if item?
      return Item.find(s_id).name
    else
      return Menu.find(s_id).name
    end
  end

end
