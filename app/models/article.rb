class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }

  has_many :comments, dependent: :destroy
  has_many :likes
  belongs_to :user

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def tags=(text)
  	text.is_a?(String) ? super(sanitize_tags(text)) : super(text)
  end

  private

  def article_params
  	params.require(:article).permit(:title, :text, :tags)
  end
  def sanitize_tags(text)
  	text.split.map(&:downcase).uniq
  end
end
