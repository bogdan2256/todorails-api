class ApplicationController < ActionController::API
  def render_api(object, status = :ok, options = {})
    if object.respond_to?(:errors) && object.errors.present?
      render json: { message: object.errors.full_messages.to_sentence },
             status: :unprocessable_entity
    else
      render({ json: object, status: status }.merge(options))
    end
  end
end
