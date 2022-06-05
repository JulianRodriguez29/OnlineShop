# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  total      :decimal(, )
#  unit_price :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#  product_id :integer
#
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product



  before_save :set_unit_price
  before_save :set_total

  def unit_price
      if persisted?
          self[:unit_price]
      else
          product.price
      end
  end


  def total
      unit_price*quantity
  end


  private

  def set_unit_price
      self[:unit_price] = unit_price 
  end

  def set_total
      self[:total] = total * quantity
  end
end