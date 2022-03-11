class Post < ApplicationRecord
  validates :comment_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :title, presence: true, length: { maximum: 250 }
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_posts_counter
    user.increment!(:post_counter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
