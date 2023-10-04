class Credential < ApplicationRecord
end

# == Schema Information
#
# Table name: credentials
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)        not null
#  external_id :string           not null
#  public_key  :string           not null
#  sign_count  :string           not null
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_credentials_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
