class Info < ActiveRecord::Base
  self.table_name = 'info'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id        # ユーザーID
  property :info_master_id # お知らせマスタID
  property :get_time       # 取得日時
  property :kidoku_flg     # 既読フラグ

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
