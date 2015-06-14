class ExpMaster < ActiveRecord::Base
  self.table_name = 'exp_master'

  include Garage::Representer
  include Garage::Authorizable

  property :kbn # 区分
  property :level # レベル
  property :exp # 必要経験値

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end