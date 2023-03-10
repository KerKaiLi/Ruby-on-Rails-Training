class Task < ApplicationRecord
    has_many :subtasks
    validates :title, :description, presence: true
    
end
