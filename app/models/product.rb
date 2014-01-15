class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(png|gif|jpg)\Z}i,
    message: 'must be a URL for an image of GIF, PNG or JPG format'
  }
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  
  def self.latest
    Product.order(:updated_at).last
  end
end
