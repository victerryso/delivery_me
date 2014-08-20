# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  name            :string(255)      default("Someone")
#  image           :text             default("http://www.fedical.com/wp-content/uploads/2014/04/Happy-face-coloring-pages.jpg")
#  credibility     :integer          default(0)
#  address         :string(255)
#  latitude        :float
#  longitude       :float
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  before_save :geocode
  has_many :tasks
  has_many :messages

  has_secure_password

  validates :email, :presence => true, :length => { :minimum => 5 }, :uniqueness => true
  validates :password_digest, :presence => true
  validates :name, :presence => true

  private

  def geocode
    result = Geocoder.search(self.address).first
    if result.present?
      self.latitude = result.latitude
      self.longitude = result.longitude
    else
      self.latitude = -33.87
      self.longitude = 151.20
    end
  end
end
