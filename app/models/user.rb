# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  manager         :boolean
#  password_digest :string
#  email           :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null

class User < ApplicationRecord
  has_many :tasks
  has_many :events, through: :tasks
  has_secure_password
  validates :email, uniqueness: true
end
