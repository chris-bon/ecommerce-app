class Supplier < ActiveRecord::Base
  has_many :products, dependent: :destroy

  validates :name, :email, :phone_number, presence: true
end
