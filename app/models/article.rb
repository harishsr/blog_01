class Article < ApplicationRecord
  validates :title, presence: true, 
                    length: 5..250
  validates :content, presence: true,
                    length: 5..40_000
end
