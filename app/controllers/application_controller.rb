class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  protected

  def json_api(data, status, fields = {}, includes = "")
    json_api_params = JsonApi::Params.new(fields, includes)
    {
      jsonapi: data,
      fields: json_api_params.to_fields,
      include: json_api_params.to_include,
      status: status
    }
  end

  def json_error(errors, status = 500)
    {
      json: { errors: errors },
      status: status
    }
  end
end
