class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :profile_pic, dependent: :destroy
  has_many :events, as: :eventable, dependent: :destroy
  has_many :items, as: :itemable, dependent: :destroy
end
