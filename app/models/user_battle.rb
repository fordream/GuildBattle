class UserBattle < ActiveRecord::Base
  self.table_name = 'user_battle'

  include Garage::Representer
  include Garage::Authorizable

  belongs_to :user

  property :user_id # ユーザーID
  property :image_no # 画像番号
  property :zokusei # 属性
  property :hp # HP
  property :hp_max # 最大HP
  property :sou_senryoku # 総戦力
  property :sou_kou # 総物攻
  property :sou_bou # 総物防
  property :sou_makou # 総魔攻
  property :sou_mabou # 総魔防
  property :kou_zougenti # 物攻増減値
  property :bou_zougenti # 物防増減値
  property :makou_zougenti # 魔攻増減値
  property :mabou_zougenti # 魔防増減値
  property :sanka_flg # 参加中フラグ

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end