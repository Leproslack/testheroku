class Admin::ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "admin", password: "12345678"

  layout "admin/application"
end