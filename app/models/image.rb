class Image < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :product_id, :url
  validates :product_id, numericality: {only_integer: true}
end
