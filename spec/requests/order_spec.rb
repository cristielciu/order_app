require 'rails_helper'
require 'pry'

describe 'Orders' do
  describe 'index' do
    it 'lists all available countries' do
      create_list(:order, 10, status: 'Pending')
      expected_response = ActiveModel::Serializer::CollectionSerializer.new(
        Order.all, each_serializer: OrderSerializer
      )

      get '/orders'

      expect(response.body).to eql(expected_response.to_json)
    end
  end
end
