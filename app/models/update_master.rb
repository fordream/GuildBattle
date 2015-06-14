class UpdateMaster < ActiveRecord::Base
  self.table_name = 'update_master'

  include Garage::Representer
  include Garage::Authorizable

  property :no # バージョン
  property :naiyo # 更新内容
  property :start_time # 開始日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end