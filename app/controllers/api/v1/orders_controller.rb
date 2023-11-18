class Api::V1::OrdersController < ApplicationController
  before_action :check_login, only: %i[index show create]
  def index
    render json: OrderSerializer.new(current_user.orders).serializable_hash.to_json
  end

  def create
    order = current_user.orders.build(order_params)
    if order.save
        render json: order, status: 201
    else
        render json: { errors: order.errors }, status: 422
    end
end

private
def order_params
    params.require(:order).permit(:total, product_ids: [])
end

end
