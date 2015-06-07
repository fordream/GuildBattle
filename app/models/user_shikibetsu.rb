class UserShikibetsu < ActiveRecord::Base
  self.table_name = 'user_shikibetsu'

  include Garage::Representer
  include Garage::Authorizable

  after_initialize :set_default_value

  belongs_to :user

  property :user_shikibetsu_id
  property :kishu_info
  property :update_version

  private

  def set_default_value
    self.user_shikibetsu_id = SecureRandom.base64(48)
    self.kishu_info         = 0
    self.update_version     = 0
  end

end