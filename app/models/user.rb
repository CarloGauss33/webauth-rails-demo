class User < ApplicationRecord
  has_many :credentials, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def get_challenge
    Session.find_or_create(id)
  end

  def destroy_challenge
    Session.destroy(id)
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
