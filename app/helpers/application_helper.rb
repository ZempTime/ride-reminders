module ApplicationHelper
  def active?(current_controller)
    (params[:controller] == current_controller.to_s) ? "active" : ""
  end
end
