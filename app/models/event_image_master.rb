class EventImageMaster < ActiveRecord::Base
  self.table_name = 'event_image_master'

  include Garage::Representer
  include Garage::Authorizable

  property :event_master_id # イベントマスタID
  property :hyoji_kbn # 表示区分
  property :image_no # 画像番号
  property :link # リンク

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end