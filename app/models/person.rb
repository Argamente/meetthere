class Person < ApplicationRecord
    belongs_to :user_account
    has_many :stories, class_name:"Story"
end
