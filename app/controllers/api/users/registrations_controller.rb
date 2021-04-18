# frozen_string_literal: true

class Api::Users::RegistrationsController < Devise::RegistrationsController
  include ActionController::MimeResponds
  before_action :update_create_params
  respond_to :json
  
  def create
    build_resource(sign_up_params)
    resource.save
    return render unprocessable_entity_response(resource) if resource.errors.any?

    render success_response(resource)
  end

  private

  def update_create_params
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [ 
        :email, :name, :last_name
      ]
    )
  end

  def success_response(resource)
    {
      jsonapi: resource,
      status: 201
    }
  end

  def unprocessable_entity_response(resource)
    message = resource&.errors&.details || 'unknown_error'
    {
      json: {
        error: {
          detail: message
        }
      },
      status: 422
    }
  end
end
