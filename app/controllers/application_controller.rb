# class ApplicationController
class ApplicationController < ActionController::API
  serialization_scope :view_context

  def view_context
    self
  end
end
