class Shisetsu < ActiveRecord::Base
  self.table_name = 'shisetsu'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id            # ユーザーID
  property :shisetsu_master_id # 施設マスタID
  property :level              # レベル

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
