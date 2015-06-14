class PresentMaster < ActiveRecord::Base
  self.table_name = 'present_master'

  include Garage::Representer
  include Garage::Authorizable

  property :kbn # 区分
  property :login_su # ログイン数
  property :renzoku_login_su # 連続ログイン数
  property :shotai_su # 招待数
  property :kind # 種類
  property :item_master_id # アイテムマスタID
  property :suryo # 数量
  property :info # 説明
  property :regist_time # 配信開始日時
  property :update_time # 配信終了日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end