class ImageMaster < ActiveRecord::Base
  self.table_name = 'image_master'

  include Garage::Representer
  include Garage::Authorizable

  property :no             # 番号
  property :kbn            # 区分
  property :directory      # 場所
  property :name           # 画像名
  property :regist_time    # 公開開始日
  property :update_time    # 公開終了日
  property :update_version # 更新バージョン

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
