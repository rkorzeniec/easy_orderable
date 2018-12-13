class Request < ApplicationRecord
  belongs_to :renter, class_name: 'User', foreign_key: :user_id
end
