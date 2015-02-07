class LoyaltyProgram < ActiveRecord::Base
  enum s_type: [:item, :menu]
  belongs_to :store
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :s_required
  validates_presence_of :s_discount

end
