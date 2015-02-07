class Beacon < ActiveRecord::Base
  belongs_to :store
  has_one :menu
  validates_presence_of :b_id
  validates_uniqueness_of :b_id
  validates_presence_of :menu_id
end
