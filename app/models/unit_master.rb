class UnitMaster < ActiveRecord::Base
  self.inheritance_column = :escape_from_type
  self.table_name = 'unit_master'

  include Garage::Representer
  include Garage::Authorizable

  property :no # 番号
  property :image_no # 画像番号
  property :rare # レア度
  property :level_max # 初期最大レベル
  property :name # 名前
  property :info # 説明
  property :zokusei # 属性
  property :type # タイプ
  property :cost # コスト
  property :kou # 攻撃力
  property :bou # 防御力
  property :zenei_skill_id1 # 前衛スキルID1
  property :zenei_skill_level1 # 前衛スキルレベル1
  property :zenei_skill_kbn1 # 前衛スキル区分1
  property :zenei_skill_id2 # 前衛スキルID2
  property :zenei_skill_level2 # 前衛スキルレベル2
  property :zenei_skill_kbn2 # 前衛スキル区分2
  property :koei_skill_id1 # 後衛スキルID1
  property :koei_skill_level1 # 後衛スキルレベル1
  property :koei_skill_kbn1 # 後衛スキル区分1
  property :koei_skill_id2 # 後衛スキルID2
  property :koei_skill_level2 # 後衛スキルレベル2
  property :koei_skill_kbn2 # 後衛スキル区分2
  property :leader_skill_id # リーダースキルID
  property :leader_skill_level # リーダースキルレベル
  property :leader_skill_kbn # リーダースキル区分
  property :gatya_muryo_start_time # 無料ガチャ公開開始日時
  property :gatya_muryo_end_time # 無料ガチャ公開終了日時
  property :gatya_kakin_start_time # 課金ガチャ公開開始日時
  property :gatya_kakin_end_time # 課金ガチャ公開終了日時
  property :regist_time # 登録日時
  property :update_time # 更新日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end