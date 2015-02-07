class Menu < ActiveRecord::Base
  belongs_to :store
  has_many :items, :dependent => :destroy
  accepts_nested_attributes_for :items
  validates_presence_of :name
  validates_presence_of :description
end
