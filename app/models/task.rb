class Task < ApplicationRecord
    has_one_attached :eyecatch
    
    validates :title, presence: true
    validates :description, presence: true
    validates :deadline, presence: true

    belongs_to :user
    belongs_to :board, optional: true
    has_many :comments, dependent: :destroy
end
