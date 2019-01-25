class ApplicationController < ActionController::Base
  before_action :render_503_except_for_whitelisted_ips, if: :maintenance_mode?
  protect_from_forgery with: :exception
  # http_basic_authenticate_with :name => ENV['BASIC_AUTH_USERNAME'], :password => ENV['BASIC_AUTH_PASSWORD'] if Rails.env == "production"

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  end

  def maintenance_mode?
    ENV["MAINTENANCE_MODE"] == "true"
  end

  def render_503_except_for_whitelisted_ips
    ips_in_whitelist = (ENV["ALLOWED_IPS"] || "").split(",")
    return if ips_in_whitelist.include?(request.remote_ip)

    render(
      template: 'errors/error_503',
      content_type: "text/html",
      layout: 'application',
      status: :service_unavailable,
    )
  end
end
