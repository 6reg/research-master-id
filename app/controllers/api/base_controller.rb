class Api::BaseController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :restrict_access

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
end
