class PremiumMaster < ActiveRecord::Base
  self.table_name = 'premium_master'

  include Garage::Representer
  include Garage::Authorizable

  property :kbn            # 区分
  property :unit_master_id # ユニットマスタID
  property :item_master_id # アイテムマスタID
  property :suryo          # 数量
  property :seigen         # 交換制限
  property :start_time     # 公開開始日時
  property :end_time       # 公開終了日時
  property :regist_time    # 登録日時
  property :update_time    # 更新日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
