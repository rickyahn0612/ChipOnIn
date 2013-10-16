class Event < ActiveRecord::Base
  belongs_to :eventable, polymorphic: true
  has_attached_file :photo, :dependent => :destroy
  geocoded_by :address
  after_validation :geocode
  has_many :items, as: :itemable, :dependent => :destroy
  has_many :volunteers, as: :volunteerable, :dependent => :destroy
end
