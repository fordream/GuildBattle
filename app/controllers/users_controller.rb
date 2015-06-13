class UsersController < ApiController
  include Garage::RestfulActions

  # show
  def require_resource
    @resource = current_resource_owner
  end

end
