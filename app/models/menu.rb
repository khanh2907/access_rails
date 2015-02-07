class Menu < ActiveRecord::Base
  belongs_to :store
  has_many :items, :dependent => :destroy
  validates_presence_of :name
  validates_presence_of :description
  accepts_nested_attributes_for :items, :allow_destroy => true
end
