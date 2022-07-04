class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {minimum:6, maximumm:100}
    validates :description, presence: true, length: {minimum:10, maximumm:300}
end