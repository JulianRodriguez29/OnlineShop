# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  subtotal   :decimal(, )
#  total      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Order < ApplicationRecord
  has_many :order_items
  before_save :set_subtotal


  def subtotal
    order_items.collect{|order_item| order_item.valid? ? order_item.unit_price*order_item.quantity : 0}.sum
  end


  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
  
end
