class Api::V1::Users::MeController < ApplicationController
  before_action :doorkeeper_authorize!

  def show
    render json: UserSerializer.new(current_resource_owner).serializable_hash
  end
end