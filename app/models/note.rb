class Note < ApplicationRecord
  validates :title, :body, :date, presence: true
end
