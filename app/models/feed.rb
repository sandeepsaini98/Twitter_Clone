class Feed < ApplicationRecord
    belongs_to :user
    validates :username, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 200 }
end
