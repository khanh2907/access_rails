class Menu < ActiveRecord::Base
  belongs_to :store
  has_many :items, :dependent => :destroy
  accepts_nested_attributes_for :items
end
