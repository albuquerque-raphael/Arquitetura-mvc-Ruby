class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    # ... other attributes and validations
  end