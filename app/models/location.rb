# == Schema Information
#
# Table name: locations
#
#  id                   :integer          not null, primary key
#  name                 :string
#  description          :text
#  special_instructions :text
#  event_id             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Location < ApplicationRecord
  belongs_to :event
end
