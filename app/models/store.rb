class Store < ActiveRecord::Base
  belongs_to :user
  has_many :menus
  validates_presence_of :name
  validates_presence_of :address
  validates_uniqueness_of :name
end
