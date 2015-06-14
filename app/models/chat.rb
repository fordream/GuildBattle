class Chat < ActiveRecord::Base
  self.table_name = 'chat'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id # ユーザーID
  property :naiyo # 内容
  property :regist_time # 登録日時
  property :delflg # 削除フラグ

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end