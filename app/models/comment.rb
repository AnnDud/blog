class Comment < ApplicationRecord
  belongs_to :article
  validates :body, presence: true, length: { minimum: 6, maximum: 500 }

end
