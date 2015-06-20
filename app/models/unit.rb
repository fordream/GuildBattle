class Unit < ActiveRecord::Base
  self.table_name = 'unit'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id            # ユーザーID
  property :unit_master_id     # ユニットマスタID
  property :star               # 星
  property :level_max          # 最大レベル
  property :level              # レベル
  property :exp                # 経験値
  property :kou                # 攻撃力
  property :bou                # 防御力
  property :zenei_skill_id1    # 前衛スキルID1
  property :zenei_skill_level1 # 前衛スキルレベル1
  property :zenei_skill_kbn1   # 前衛スキル区分1
  property :zenei_skill_id2    # 前衛スキルID2
  property :zenei_skill_level2 # 前衛スキルレベル2
  property :zenei_skill_kbn2   # 前衛スキル区分2
  property :koei_skill_id1     # 後衛スキルID1
  property :koei_skill_level1  # 後衛スキルレベル1
  property :koei_skill_kbn1    # 後衛スキル区分1
  property :koei_skill_id2     # 後衛スキルID2
  property :koei_skill_level2  # 後衛スキルレベル2
  property :koei_skill_kbn2    # 後衛スキル区分2
  property :leader_skill_id    # リーダースキルID
  property :leader_skill_level # リーダースキルレベル
  property :leader_skill_kbn   # リーダースキル区分
  property :regist_time        # 登録日時
  property :update_time        # 更新日時
  property :delflg             # 削除フラグ

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
