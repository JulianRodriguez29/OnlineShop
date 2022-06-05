# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  price      :decimal(, )
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  has_many :order_items
  
end
