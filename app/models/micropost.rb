class Micropost < ApplicationRecord
  belongs_to :user
  scope :by_date, -> {order "created_at DESC"}
  scope :feed, -> (id) {where :user_id => id}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.model.micropost.max_size}
  validate :picture_size

  private

  def picture_size
    if picture.size > Settings.model.micropost.pic_size.megabytes
      errors.add :picture, t(".pic_size")
    end
  end
end
