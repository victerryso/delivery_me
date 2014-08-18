# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  courier_id   :integer
#  name         :string(255)
#  description  :text
#  time         :time
#  price        :integer
#  from_address :string(255)
#  from_lat     :float
#  from_lng     :float
#  to_address   :string(255)
#  to_lat       :float
#  to_lng       :float
#  created_at   :datetime
#  updated_at   :datetime
#

class Task < ActiveRecord::Base
  before_save :geocode
  belongs_to :user
  has_many :messages

  private

  def geocode
    from = Geocoder.search(self.from_address).first
    if from.present?
      self.from_lat = from.latitude
      self.from_lng = from.longitude
    end

    to = Geocoder.search(self.to_address).first
    if to.present?
      self.to_lat = to.latitude
      self.to_lng = to.longitude
    end
  end

end
