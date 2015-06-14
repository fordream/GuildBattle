class Guild < ActiveRecord::Base
  self.table_name = 'guild'

  include Garage::Representer
  include Garage::Authorizable

  property :name # 名前
  property :rank # ランク
  property :exp # 昇格値
  property :win_su # 勝利数
  property :lose_su # 敗北数
  property :draw_su # 引き分け数

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end