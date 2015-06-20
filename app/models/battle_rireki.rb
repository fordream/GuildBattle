class BattleRireki < ActiveRecord::Base
  self.table_name = 'battle_rireki'

  include Garage::Representer
  include Garage::Authorizable

  property :battle_id      # バトルID
  property :group_id       # グループID
  property :kbn            # 区分
  property :shiyo_user_id  # 使用ユーザーID
  property :shiyo_unit_id  # 使用ユニットID
  property :kouka_user_id  # 効果ユーザーID
  property :kouka_ryo      # 効果量
  property :skill_id       # スキルID
  property :kou_zougenti   # 物攻増減値
  property :bou_zougenti   # 物防増減値
  property :makou_zougenti # 魔攻増減値
  property :mabou_zougenti # 魔防増減値
  property :hyoji_flg      # 表示フラグ
  property :regist_time    # 登録日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
