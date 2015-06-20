class Image < ActiveRecord::Base
  self.table_name = 'image'

  include Garage::Representer
  include Garage::Authorizable

  property :user_id         # ユーザーID
  property :image_master_id # 画像マスタID
  property :get_flg         # 取得フラグ

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
