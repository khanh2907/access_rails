class Item < ActiveRecord::Base
  belongs_to :menu
  validates_presence_of :name
  validates_presence_of :price
end
