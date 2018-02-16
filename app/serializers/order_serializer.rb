class OrderSerializer < ActiveModel::Serializer
  attributes :first_name,
             :last_name, :phone_number, :products, :status, :details
end
