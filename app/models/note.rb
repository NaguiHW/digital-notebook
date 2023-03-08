class Note < ApplicationRecord
  has_rich_text :body
  validates :title, :body, :date, presence: true
end
