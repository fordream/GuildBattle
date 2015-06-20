class Dekki < ActiveRecord::Base
  self.table_name = 'dekki'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id  # ユーザーID
  property :no       # 番号
  property :main_flg # メインフラグ

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
