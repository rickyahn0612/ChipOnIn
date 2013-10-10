class Item < ActiveRecord::Base
  belongs_to :itemable, polymorphic: true
  has_many :volunteers, as: :volunteerable, :dependent => :destroy
end
