# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  address    :string
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :tasks
  has_many :locations
  validates :start_date, presence: true
  validates :end_date, presence: true

  def start_time
    self.start_date
  end

  def end_time
    self.end_date
  end

end
