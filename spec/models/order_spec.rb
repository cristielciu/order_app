require 'rails_helper'

describe 'Order' do
  describe '#validators' do
    it 'should reject when order has no first/last name' do
      order = build(:order, first_name: '')

      expect(order.save).to be_falsey

      order = build(:order, last_name: '')

      expect(order.save).to be_falsey

      order = build(:order, first_name: '', last_name: '')

      expect(order.save).to be_falsey
    end

    it 'should reject when wrong phone_number format' do
      order = build(:order, phone_number: '123a321')

      expect(order.save).to be_falsey

      order = build(:order, phone_number: '21231231231221312312321232')

      expect(order.save).to be_falsey
    end

    it 'should reject when wrong status' do
      order = build(:order, status: '')

      expect(order.save).to be_falsey

      order = build(:order, status: 'no_status')

      expect(order.save).to be_falsey
    end

    it 'should reject when no products' do
      order = build(:order, products: '')

      expect(order.save).to be_falsey
    end
  end
end
