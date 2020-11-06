class Prototype < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image
  
  validates :consept, presence: true
  validates :title, presence: true
  validates :catch, presence: true
  validates :image, presence: true
  # , unless: :was_attached?

  # def was_attached?
    # self.image.attached?
    # image_path = Rails.root.join("tmp", "sample.png")
    
    # article = Article.first
    # File.open(image_path) do |io|
      # article.image.attach(io: io, filename: "sample.png")
    # end
    # article.save!
  # end
  

end
