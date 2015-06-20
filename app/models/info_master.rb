class InfoMaster < ActiveRecord::Base
  self.table_name = 'info_master'

  include Garage::Representer
  include Garage::Authorizable

  property :kbn         # 区分
  property :naiyo       # 内容
  property :regist_time # 配信開始日時
  property :update_time # 配信終了日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
