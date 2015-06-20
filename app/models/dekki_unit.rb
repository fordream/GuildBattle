class DekkiUnit < ActiveRecord::Base
  self.table_name = 'dekki_unit'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id    # ユーザーID
  property :dekki_id   # デッキID
  property :unit_id    # ユニットID
  property :leader_flg # リーダーフラグ

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
