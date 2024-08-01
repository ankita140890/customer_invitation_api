class CustomersService
  MUMBAI_LAT = 19.0590317
  MUMBAI_LON = 72.7553452
  MAX_DISTANCE = 100 # kilometers

  def self.filter_customers_within_range(customers)
    customers.select do |customer|
      distance = DistanceCalculator.haversine(
        MUMBAI_LAT,
        MUMBAI_LON,
        customer.latitude,
        customer.longitude
      )
      distance <= MAX_DISTANCE
    end
  end

  def self.customer_instance(customer_data)
    Customer.new(
      name: customer_data['name'],
      user_id: customer_data['user_id'],
      latitude: customer_data['latitude'],
      longitude: customer_data['longitude']
    )
  end
end
