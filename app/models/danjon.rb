class Danjon < ActiveRecord::Base
  self.table_name = 'danjon'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id          # ユーザーID
  property :danjon_master_id # ダンジョンマスタID
  property :level1           # レベル1
  property :get_ritsu1       # 取得率1
  property :level2           # レベル2
  property :get_ritsu2       # 取得率2
  property :level3           # レベル3
  property :get_ritsu3       # 取得率3
  property :unit_master_id   # 敵ユニットマスタID
  property :hp               # HP
  property :hp_max           # 最大HP
  property :kaisu            # バトル回数

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
