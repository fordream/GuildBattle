class SkillMaster < ActiveRecord::Base
  self.inheritance_column = :escape_from_type
  self.table_name = 'skill_master'

  include Garage::Representer
  include Garage::Authorizable

  property :image_no     # 画像番号
  property :kbn          # 区分
  property :type         # タイプ
  property :name         # 名前
  property :info         # 説明
  property :cost         # コスト
  property :zokusei      # 属性
  property :ap           # AP
  property :kaisu        # 回数
  property :taisyo       # 対象
  property :taisyo_min   # 最小対象数
  property :taisyo_max   # 最大対象数
  property :bairitsu     # 倍率
  property :kou_zougen   # 物攻増減
  property :bou_zougen   # 物防増減
  property :makou_zougen # 魔攻増減
  property :mabou_zougen # 魔防増減
  property :start_time   # 公開開始日時
  property :end_time     # 公開終了日時
  property :regist_time  # 登録日時
  property :update_time  # 更新日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
