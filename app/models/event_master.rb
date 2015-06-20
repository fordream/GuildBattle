class EventMaster < ActiveRecord::Base
  self.table_name = 'event_master'

  include Garage::Representer
  include Garage::Authorizable

  property :name        # イベント名
  property :regist_time # 公開開始日時
  property :update_time # 公開終了日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
