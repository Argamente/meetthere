class Story < ApplicationRecord
  belongs_to :person
  has_many :memories, class_name: "Memory"
end
