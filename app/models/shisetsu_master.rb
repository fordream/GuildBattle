class ShisetsuMaster < ActiveRecord::Base
  self.table_name = 'shisetsu_master'

  include Garage::Representer
  include Garage::Authorizable

  property :image_no    # 画像番号
  property :name        # 名前
  property :level_max   # 最大レベル
  property :time        # 回収時間
  property :jinko       # 人口
  property :get_coin    # コイン回収
  property :get_mana    # マナ回収
  property :get_ap      # AP回収
  property :need_coin   # 必要コイン
  property :need_seisho # 必要聖書
  property :position_x  # 設置場所X
  property :position_y  # 設置場所Y
  property :regist_time # 公開開始日時
  property :update_time # 公開終了日時
  property :regist_time # 登録日時
  property :update_time # 更新日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
