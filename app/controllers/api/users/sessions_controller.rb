
# frozen_string_literal: true

class Api::Users::SessionsController < Devise::SessionsController
  include ActionController::MimeResponds
  respond_to :json

  def create
    byebug
    super { |resource| @resource = resource }
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource, root: :user
  end

  def respond_to_on_destroy
    head :ok
  end
end
