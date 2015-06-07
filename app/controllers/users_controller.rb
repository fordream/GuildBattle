class UsersController < ApiController
  include Garage::RestfulActions

  # index
  def require_resources
    @resources = current_resource_owner
  end

  # show
  def require_resource
    @resource = current_resource_owner
  end

  # create
  def create_resource
    ActiveRecord::Base.transaction do
      # ユーザーテーブル
      @resource = @resources.new(name: params[:name], shotai_id: params[:shotai_id])
      @resource.save!

      # ユーザー識別テーブル
      auth = UserShikibetsu.new(user_id: @resource.id)
      auth.save!
    end
    @resource
  end

end
