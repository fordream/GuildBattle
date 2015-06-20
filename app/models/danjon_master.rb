class DanjonMaster < ActiveRecord::Base
  self.table_name = 'danjon_master'

  include Garage::Representer
  include Garage::Authorizable

  property :image_no         # 画像番号
  property :unit_master_id1  # ユニットマスタID1
  property :shutsugen_ritsu1 # 出現率1
  property :get_ritsu1       # 取得率1
  property :hp1              # 基本HP1
  property :unit_master_id2  # ユニットマスタID2
  property :shutsugen_ritsu2 # 出現率2
  property :get_ritsu2       # 取得率2
  property :hp2              # 基本HP2
  property :unit_master_id3  # ユニットマスタID3
  property :shutsugen_ritsu3 # 出現率3
  property :get_ritsu3       # 取得率3
  property :hp3              # 基本HP3
  property :start_time       # 公開開始日時
  property :regist_time      # 登録日時
  property :update_time      # 更新日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
