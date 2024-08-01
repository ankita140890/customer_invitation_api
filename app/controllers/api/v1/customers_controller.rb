class Api::V1::CustomersController < ApplicationController
  def create
    file = params[:file]
    if file.nil?
      render json: { error: 'File not provided' }, status: :unprocessable_entity
      return
    end

    customers = []
    begin
      file_content = file.read
      file_content.each_line do |line|
        customer_data = JSON.parse(line)
        customers << CustomersService.customer_instance(customer_data)
      end
    rescue JSON::ParserError => e
      render json: { error: 'Invalid JSON format' }, status: :unprocessable_entity
      return
    end

    within_range_customers = CustomersService.filter_customers_within_range(customers)
    sorted_customers = within_range_customers.sort_by(&:user_id)

    render json: sorted_customers.map { |c| { name: c.name, user_id: c.user_id } }
  end
end
