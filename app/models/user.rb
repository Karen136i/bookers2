class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  has_many :books, dependent: :destroy
  
  has_one_attached :profile_image
  
  validates :name, length: { minimum: 2, message: "Name is too short (minimum is 2 characters)" }, uniqueness: true
  validates :name, length: { maximum: 20, messeage: "Name is too long (maximum is 20 characters)" }, uniqueness: true
  validates :introduction, length: { maximum: 50, messeage: "Introduction is too long (maximum is 50 characters)" }
 
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
