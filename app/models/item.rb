class Item < ActiveRecord::Base
  belongs_to :itemable, polymorphic: true
  has_many :volunteers, as: :volunteerable, :dependent => :destroy
  validates :name, :presence => true
  validates :quantity_needed, :presence => true
  validates_numericality_of :quantity_needed, :on => :create
end
