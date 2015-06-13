class User < ActiveRecord::Base
  self.table_name = 'user'

  include Garage::Representer
  include Garage::Authorizable

  after_initialize :set_default_value

  has_one :user_shikibetsu

  property :id
  property :name
  property :girudo_id
  property :shotai_id
  property :shotai_su
  property :level
  property :exp
  property :coin
  property :mana_p
  property :crystal_kakin
  property :crystal_muryo
  property :premium_p
  property :seisyo
  property :fvko
  property :unit_max
  property :huriwaike_p
  property :unit_cost
  property :skill_cost
  property :stamina
  property :stamina_max
  property :ap
  property :ap_max
  property :koei_flg
  property :final_login_time
  property :renzoku_login
  property :total_login
  property :kouken_p
  property :battle_su
  property :battle_sanka_su
  property :regist_time
  property :update_time
  property :account_stop_flg

  property :user_shikibetsu

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