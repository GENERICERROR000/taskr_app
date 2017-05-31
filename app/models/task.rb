# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  title         :string
#  event_id      :integer
#  location_id   :integer
#  task_location :string
#  end_location  :string ######get rid of me
#  description   :text
#  priority      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Task < ApplicationRecord
  belongs_to :event 
  belongs_to :location
end
