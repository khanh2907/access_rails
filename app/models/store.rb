class Store < ActiveRecord::Base
  belongs_to :user
  has_many :menus
  has_many :beacons
  validates_presence_of :name
  validates_presence_of :address
  validates_uniqueness_of :name
end
