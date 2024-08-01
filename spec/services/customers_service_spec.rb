require 'rails_helper'

RSpec.describe CustomersService, type: :service do
  it 'filters customers within 100km of Mumbai' do
    customers = [
      Customer.new(name: 'Alice', user_id: 1, latitude: 19.0590317, longitude: 72.7553452),
      Customer.new(name: 'Bob', user_id: 2, latitude: 18.0, longitude: 72.0)
    ]
    result = CustomersService.filter_customers_within_range(customers)
    expect(result.map(&:name)).to contain_exactly('Alice')
  end
end
