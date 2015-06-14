class Koukan < ActiveRecord::Base
  self.table_name = 'koukan'

  include Garage::Representer
  include Garage::Authorizable

  property :kbn # 区分
  property :premium_master_id # プレミアムマスタID

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end