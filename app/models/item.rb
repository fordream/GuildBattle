class Item < ActiveRecord::Base
  self.table_name = 'item'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id # ユーザーID
  property :item_master_id # アイテムマスタID
  property :shojisu # 所持数
  property :regist_time # 登録日時
  property :update_time # 更新日時
  property :delflg # 削除フラグ

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end