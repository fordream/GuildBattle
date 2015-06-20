class Present < ActiveRecord::Base
  self.table_name = 'present'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id           # ユーザーID
  property :present_master_id # プレゼントマスタID
  property :get_time          # 取得日時
  property :get_flg           # 取得フラグ

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
