# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer

class Product < ActiveRecord::Base

	belongs_to :user

  attr_accessible :title, :description, :price

  validates :title, :description, :price, presence: true

  validates :title, uniqueness: true, length: { in: 4..10 }

  validates :description, length: { minimum: 10 }

  validates :price, numericality: true

end
