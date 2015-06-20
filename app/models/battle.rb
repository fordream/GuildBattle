class Battle < ActiveRecord::Base
  self.table_name = 'battle'

  include Garage::Representer
  include Garage::Authorizable

  property :no            # 番号
  property :girudo_id1    # ギルドID1
  property :bp1           # BP1
  property :combo1        # コンボ数1
  property :user1         # 前衛ユーザーID1
  property :user2         # 前衛ユーザーID2
  property :user3         # 前衛ユーザーID3
  property :user4         # 前衛ユーザーID4
  property :user5         # 前衛ユーザーID5
  property :girudo_id2    # ギルドID2
  property :bp2           # BP2
  property :combo2        # コンボ数2
  property :user6         # 前衛ユーザーID6
  property :user7         # 前衛ユーザーID7
  property :user8         # 前衛ユーザーID8
  property :user9         # 前衛ユーザーID9
  property :user10        # 前衛ユーザーID10
  property :extra_time    # 延長時間
  property :win_girudo_id # 勝利ギルドID
  property :regist_time   # 登録日時
  property :update_time   # 更新日時

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
  end

end
