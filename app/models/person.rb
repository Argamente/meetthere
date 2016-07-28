class Person < ApplicationRecord
    belongs_to :user_account
    has_many :story
end
