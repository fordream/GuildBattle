class ItemMaster < ActiveRecord::Base
  self.table_name = 'item_master'

  include Garage::Representer
  include Garage::Authorizable

  property :no # 区分
  property :image_no # 画像番号
  property :name # 名前
  property :info # 説明
  property :koukaryo # 効果量
  property :kakuritsu # 確率
  property :regist_time # 登録日時
  property :update_time # 更新日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end