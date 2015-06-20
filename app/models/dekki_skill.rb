class DekkiSkill < ActiveRecord::Base
  self.table_name = 'dekki_skill'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id         # ユーザーID
  property :dekki_id        # デッキID
  property :skill_master_id # スキルマスタID

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
