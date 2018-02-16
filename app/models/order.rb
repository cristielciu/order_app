# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  products     :string
#  status       :string
#  details      :text
#

class Order < ApplicationRecord
  validates_presence_of :first_name, :last_name, :phone_number, :products, :status
  validates :phone_number, length: { is: 10 }
  validates :phone_number, :numericality => { :only_integer => true }
  validates_inclusion_of :status,
                         in: %w[Delivered Pending],
                         message: 'Status must be \'Delivered\' or \'Pending\''

  scope :with_status, ->(status) { where(status: status) }
end
