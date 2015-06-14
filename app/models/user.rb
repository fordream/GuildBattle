class User < ActiveRecord::Base
  self.table_name = 'user'

  include Garage::Representer
  include Garage::Authorizable

  after_initialize :set_default_value

  has_one :user_shikibetsu
  has_many :user_battle

  property :name # ユーザー名
  property :girudo_id # ギルドID
  property :shotai_id # 招待ID
  property :shotai_su # 招待数
  property :level # レベル
  property :exp # 経験値
  property :coin # コイン
  property :mana_p # マナP
  property :crystal_kakin # 課金クリスタル
  property :crystal_muryo # 無料クリスタル
  property :premium_p # プレミアムP
  property :seisyo # 聖書
  property :fvko # FV粉
  property :unit_max # キャラ最大数
  property :huriwaike_p # 振り分けP
  property :unit_cost # キャラコスト
  property :skill_cost # スキルコスト
  property :stamina # スタミナ
  property :stamina_max # 最大スタミナ
  property :ap # AP
  property :ap_max # 最大AP
  property :koei_flg # 後衛希望フラグ
  property :final_login_time # 最終ログイン日時
  property :renzoku_login # 連続ログイン
  property :total_login # 合計ログイン
  property :kouken_p # ギルド貢献P
  property :battle_su # 開催バトル数
  property :battle_sanka_su # バトル参加数
  property :regist_time # 登録日時
  property :update_time # 更新日時
  property :account_stop_flg # アカウント停止フラグ

  property :user_shikibetsu
  collection :user_battle

  def self.build_permissions(perms, other, target)
    perms.permits! :write
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :write
    perms.permits! :read
  end

  def self.new_user(name, shotai_id)
    u = new(name: name, shotai_id: shotai_id)
    u.save!
    # ユーザー識別テーブル
    us = UserShikibetsu.new(user_id: u.id)
    us.save!

    us.user_shikibetsu_id
  end

  private

  def set_default_value
    now                   = Time.now
    self.girudo_id        = 0
    self.shotai_su        = 0
    self.level            = 1
    self.exp              = 0
    self.coin             = 0
    self.mana_p           = 0
    self.crystal_kakin    = 0
    self.crystal_muryo    = 0
    self.premium_p        = 0
    self.seisyo           = 0
    self.fvko             = 0
    self.unit_max         = 10
    self.huriwaike_p      = 0
    self.unit_cost        = 20
    self.skill_cost       = 10
    self.stamina          = 30
    self.stamina_max      = 30
    self.ap               = 20
    self.ap_max           = 20
    self.koei_flg         = 0
    self.final_login_time = now
    self.renzoku_login    = 1
    self.total_login      = 1
    self.kouken_p         = 0
    self.battle_su        = 0
    self.battle_sanka_su  = 0
    self.regist_time      = now
    self.update_time      = now
    self.account_stop_flg = 0
  end

end