class Event < ActiveRecord::Base
  belongs_to :eventable, polymorphic: true
  has_attached_file :photo
end
