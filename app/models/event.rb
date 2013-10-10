class Event < ActiveRecord::Base
  belongs_to :eventable, polymorphic: true
  has_attached_file :photo, :dependent => :destroy

  has_many :items, as: :itemable, :dependent => :destroy

  
end
