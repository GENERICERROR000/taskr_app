# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  title         :string
#  user_id       :integer
#  event_id      :integer
#  task_location :string
#  end_location  :string
#  description   :text
#  priority      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :locations
end
