class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'admin', password: 'Fr0mD@y1' unless Rails.env.production?
end
