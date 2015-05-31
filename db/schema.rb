# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150527142612) do

  create_table "battle", id: :integer, limit: 8, comment: "バトルテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "no",            limit: 4, null: false, comment: "番号"
    t.integer  "girudo_id1",    limit: 8, null: false, comment: "ギルドID1"
    t.integer  "bp1",           limit: 4, null: false, comment: "BP1"
    t.integer  "combo1",        limit: 4, null: false, comment: "コンボ数1"
    t.integer  "user1",         limit: 8, null: false, comment: "前衛ユーザーID1"
    t.integer  "user2",         limit: 8, null: false, comment: "前衛ユーザーID2"
    t.integer  "user3",         limit: 8, null: false, comment: "前衛ユーザーID3"
    t.integer  "user4",         limit: 8, null: false, comment: "前衛ユーザーID4"
    t.integer  "user5",         limit: 8, null: false, comment: "前衛ユーザーID5"
    t.integer  "girudo_id2",    limit: 8, null: false, comment: "ギルドID2"
    t.integer  "bp2",           limit: 4, null: false, comment: "BP2"
    t.integer  "combo2",        limit: 4, null: false, comment: "コンボ数2"
    t.integer  "user6",         limit: 8, null: false, comment: "前衛ユーザーID6"
    t.integer  "user7",         limit: 8, null: false, comment: "前衛ユーザーID7"
    t.integer  "user8",         limit: 8, null: false, comment: "前衛ユーザーID8"
    t.integer  "user9",         limit: 8, null: false, comment: "前衛ユーザーID9"
    t.integer  "user10",        limit: 8, null: false, comment: "前衛ユーザーID10"
    t.integer  "extra_time",    limit: 4, null: false, comment: "延長時間"
    t.integer  "win_girudo_id", limit: 8,              comment: "勝利ギルドID"
    t.datetime "regist_time",             null: false, comment: "登録日時"
    t.datetime "update_time",             null: false, comment: "更新日時"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "battle_rireki", id: :integer, limit: 8, comment: "バトル履歴テーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "battle_id",      limit: 8, null: false, comment: "バトルID"
    t.integer  "group_id",       limit: 4, null: false, comment: "グループID"
    t.integer  "kbn",            limit: 4, null: false, comment: "区分"
    t.integer  "shiyo_user_id",  limit: 8, null: false, comment: "使用ユーザーID"
    t.integer  "shiyo_unit_id",  limit: 8, null: false, comment: "使用ユニットID"
    t.integer  "kouka_user_id",  limit: 8, null: false, comment: "効果ユーザーID"
    t.integer  "kouka_ryo",      limit: 4,              comment: "効果量"
    t.integer  "skill_id",       limit: 8,              comment: "スキルID"
    t.integer  "kou_zougenti",   limit: 4,              comment: "物攻増減値"
    t.integer  "bou_zougenti",   limit: 4,              comment: "物防増減値"
    t.integer  "makou_zougenti", limit: 4,              comment: "魔攻増減値"
    t.integer  "mabou_zougenti", limit: 4,              comment: "魔防増減値"
    t.integer  "hyoji_flg",      limit: 4, null: false, comment: "表示フラグ"
    t.datetime "regist_time",              null: false, comment: "登録日時"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "buy_rireki", id: :integer, limit: 8, comment: "購入履歴テーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     limit: 8, null: false, comment: "ユーザーID"
    t.integer  "kbn",         limit: 4, null: false, comment: "区分"
    t.integer  "kingaku",     limit: 4,              comment: "金額"
    t.integer  "crystal",     limit: 4, null: false, comment: "クリスタル"
    t.integer  "buy_ok_flg",  limit: 4,              comment: "購入OKフラグ"
    t.datetime "regist_time",           null: false, comment: "登録日時"
    t.datetime "update_time",           null: false, comment: "更新日時"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "chat", id: :integer, limit: 8, comment: "チャットテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     limit: 8,     null: false, comment: "ユーザーID"
    t.text     "naiyo",       limit: 65535, null: false, comment: "内容"
    t.datetime "regist_time",               null: false, comment: "登録日時"
    t.integer  "delflg",      limit: 4,     null: false, comment: "削除フラグ"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "danjon", id: :integer, limit: 8, comment: "ダンジョンテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",          limit: 8, null: false, comment: "ユーザーID"
    t.integer  "danjon_master_id", limit: 8, null: false, comment: "ダンジョンマスタID"
    t.integer  "level1",           limit: 4, null: false, comment: "レベル1"
    t.integer  "get_ritsu1",       limit: 4, null: false, comment: "取得率1"
    t.integer  "level2",           limit: 4, null: false, comment: "レベル2"
    t.integer  "get_ritsu2",       limit: 4, null: false, comment: "取得率2"
    t.integer  "level3",           limit: 4, null: false, comment: "レベル3"
    t.integer  "get_ritsu3",       limit: 4, null: false, comment: "取得率3"
    t.integer  "unit_master_id",   limit: 8,              comment: "敵ユニットマスタID"
    t.integer  "hp",               limit: 4,              comment: "HP"
    t.integer  "hp_max",           limit: 4,              comment: "最大HP"
    t.integer  "kaisu",            limit: 4,              comment: "バトル回数"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "danjon_master", id: :integer, limit: 8, comment: "ダンジョンマスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image_no",         limit: 8, null: false, comment: "画像番号"
    t.integer  "unit_master_id1",  limit: 8, null: false, comment: "ユニットマスタID1"
    t.integer  "shutsugen_ritsu1", limit: 4, null: false, comment: "出現率1"
    t.integer  "get_ritsu1",       limit: 4, null: false, comment: "取得率1"
    t.integer  "hp1",              limit: 4, null: false, comment: "基本HP1"
    t.integer  "unit_master_id2",  limit: 8, null: false, comment: "ユニットマスタID2"
    t.integer  "shutsugen_ritsu2", limit: 4, null: false, comment: "出現率2"
    t.integer  "get_ritsu2",       limit: 4, null: false, comment: "取得率2"
    t.integer  "hp2",              limit: 4, null: false, comment: "基本HP2"
    t.integer  "unit_master_id3",  limit: 8, null: false, comment: "ユニットマスタID3"
    t.integer  "shutsugen_ritsu3", limit: 4, null: false, comment: "出現率3"
    t.integer  "get_ritsu3",       limit: 4, null: false, comment: "取得率3"
    t.integer  "hp3",              limit: 4, null: false, comment: "基本HP3"
    t.datetime "start_time",                 null: false, comment: "公開開始日時"
    t.datetime "regist_time",                null: false, comment: "登録日時"
    t.datetime "update_time",                null: false, comment: "更新日時"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "dekki", id: :integer, limit: 8, comment: "デッキテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    limit: 8, null: false, comment: "ユーザーID"
    t.integer  "no",         limit: 4, null: false, comment: "番号"
    t.integer  "main_flg",   limit: 4, null: false, comment: "メインフラグ"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "dekki_skill", id: :integer, limit: 8, comment: "デッキスキルテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",         limit: 8, null: false, comment: "ユーザーID"
    t.integer  "dekki_id",        limit: 8, null: false, comment: "デッキID"
    t.integer  "skill_master_id", limit: 8, null: false, comment: "スキルマスタID"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "dekki_unit", id: :integer, limit: 8, comment: "デッキユニットテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    limit: 8, null: false, comment: "ユーザーID"
    t.integer  "dekki_id",   limit: 8, null: false, comment: "デッキID"
    t.integer  "unit_id",    limit: 8, null: false, comment: "ユニットID"
    t.integer  "leader_flg", limit: 4, null: false, comment: "リーダーフラグ"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "event_image_master", id: :integer, limit: 8, comment: "イベント画像マスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "event_master_id", limit: 8, null: false, comment: "イベントマスタID"
    t.integer  "hyoji_kbn",       limit: 4, null: false, comment: "表示区分"
    t.string   "image_no",        limit: 8, null: false, comment: "画像番号"
    t.integer  "link",            limit: 4,              comment: "リンク"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "event_master", id: :integer, limit: 8, comment: "イベントマスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "name",        limit: 65535, null: false, comment: "イベント名"
    t.datetime "regist_time",               null: false, comment: "公開開始日時"
    t.datetime "update_time",               null: false, comment: "公開終了日時"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "exp_master", id: :integer, limit: 8, comment: "経験値マスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kbn",        limit: 4, null: false, comment: "区分"
    t.integer  "level",      limit: 4, null: false, comment: "レベル"
    t.integer  "exp",        limit: 4, null: false, comment: "必要経験値"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "guild", id: :integer, limit: 8, comment: "ギルドテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "name",       limit: 4, null: false, comment: "名前"
    t.integer  "rank",       limit: 4, null: false, comment: "ランク"
    t.integer  "exp",        limit: 4, null: false, comment: "昇格値"
    t.integer  "win_su",     limit: 4, null: false, comment: "勝利数"
    t.integer  "lose_su",    limit: 4, null: false, comment: "敗北数"
    t.integer  "draw_su",    limit: 4, null: false, comment: "引き分け数"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "image", id: :integer, limit: 8, comment: "画像テーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",         limit: 8, null: false, comment: "ユーザーID"
    t.integer  "image_master_id", limit: 8, null: false, comment: "画像マスタID"
    t.integer  "get_flg",         limit: 4, null: false, comment: "取得フラグ"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "image_master", id: :integer, limit: 8, comment: "画像マスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "no",             limit: 8,  null: false, comment: "番号"
    t.integer  "kbn",            limit: 4,  null: false, comment: "区分"
    t.string   "directory",      limit: 32, null: false, comment: "場所"
    t.string   "name",           limit: 32, null: false, comment: "画像名"
    t.datetime "regist_time",               null: false, comment: "公開開始日"
    t.datetime "update_time",               null: false, comment: "公開終了日"
    t.integer  "update_version", limit: 4,  null: false, comment: "更新バージョン"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "info", id: :integer, limit: 8, comment: "お知らせテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",        limit: 8, null: false, comment: "ユーザーID"
    t.integer  "info_master_id", limit: 8, null: false, comment: "お知らせマスタID"
    t.datetime "get_time",                 null: false, comment: "取得日時"
    t.integer  "kidoku_flg",     limit: 4, null: false, comment: "既読フラグ"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "info_master", id: :integer, limit: 8, comment: "お知らせマスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kbn",         limit: 4,     null: false, comment: "区分"
    t.text     "naiyo",       limit: 65535, null: false, comment: "内容"
    t.datetime "regist_time",               null: false, comment: "配信開始日時"
    t.datetime "update_time",               null: false, comment: "配信終了日時"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "item", id: :integer, limit: 8, comment: "アイテムテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",        limit: 8, null: false, comment: "ユーザーID"
    t.integer  "item_master_id", limit: 8, null: false, comment: "アイテムマスタID"
    t.integer  "shojisu",        limit: 4, null: false, comment: "所持数"
    t.datetime "regist_time",              null: false, comment: "登録日時"
    t.datetime "update_time",              null: false, comment: "更新日時"
    t.integer  "delflg",         limit: 4, null: false, comment: "削除フラグ"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "item_master", id: :integer, limit: 8, comment: "アイテムマスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "no",          limit: 4,     null: false, comment: "区分"
    t.string   "image_no",    limit: 8,     null: false, comment: "画像番号"
    t.string   "name",        limit: 32,    null: false, comment: "名前"
    t.text     "info",        limit: 65535, null: false, comment: "説明"
    t.integer  "koukaryo",    limit: 4,     null: false, comment: "効果量"
    t.integer  "kakuritsu",   limit: 4,                  comment: "確率"
    t.datetime "regist_time",               null: false, comment: "登録日時"
    t.datetime "update_time",               null: false, comment: "更新日時"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "koukan", id: :integer, limit: 8, comment: "交換履歴テーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kbn",               limit: 4, null: false, comment: "区分"
    t.integer  "premium_master_id", limit: 8,              comment: "プレミアムマスタID"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "premium_master", id: :integer, limit: 8, comment: "プレミアムマスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kbn",            limit: 4, null: false, comment: "区分"
    t.integer  "unit_master_id", limit: 8,              comment: "ユニットマスタID"
    t.integer  "item_master_id", limit: 8,              comment: "アイテムマスタID"
    t.integer  "suryo",          limit: 4, null: false, comment: "数量"
    t.integer  "seigen",         limit: 4,              comment: "交換制限"
    t.datetime "start_time",               null: false, comment: "公開開始日時"
    t.datetime "end_time",                 null: false, comment: "公開終了日時"
    t.datetime "regist_time",              null: false, comment: "登録日時"
    t.datetime "update_time",              null: false, comment: "更新日時"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "present", id: :integer, limit: 8, comment: "プレゼントテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",           limit: 8, null: false, comment: "ユーザーID"
    t.integer  "present_master_id", limit: 8, null: false, comment: "プレゼントマスタID"
    t.datetime "get_time",                    null: false, comment: "取得日時"
    t.integer  "get_flg",           limit: 4, null: false, comment: "取得フラグ"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "present_master", id: :integer, limit: 8, comment: "プレゼントマスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kbn",              limit: 4,     null: false, comment: "区分"
    t.integer  "login_su",         limit: 4,                  comment: "ログイン数"
    t.integer  "renzoku_login_su", limit: 4,                  comment: "連続ログイン数"
    t.integer  "shotai_su",        limit: 4,                  comment: "招待数"
    t.integer  "kind",             limit: 4,     null: false, comment: "種類"
    t.integer  "item_master_id",   limit: 8,                  comment: "アイテムマスタID"
    t.integer  "suryo",            limit: 4,     null: false, comment: "数量"
    t.text     "info",             limit: 65535, null: false, comment: "説明"
    t.datetime "regist_time",                    null: false, comment: "配信開始日時"
    t.datetime "update_time",                    null: false, comment: "配信終了日時"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "shisetsu", id: :integer, limit: 8, comment: "施設テーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",            limit: 8, null: false, comment: "ユーザーID"
    t.integer  "shisetsu_master_id", limit: 8, null: false, comment: "施設マスタID"
    t.integer  "level",              limit: 4, null: false, comment: "レベル"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "shisetsu_master", id: :integer, limit: 8, comment: "施設マスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image_no",    limit: 8,  null: false, comment: "画像番号"
    t.string   "name",        limit: 32, null: false, comment: "名前"
    t.integer  "level_max",   limit: 4,  null: false, comment: "最大レベル"
    t.integer  "time",        limit: 4,  null: false, comment: "回収時間"
    t.integer  "jinko",       limit: 4,               comment: "人口"
    t.integer  "get_coin",    limit: 4,               comment: "コイン回収"
    t.integer  "get_mana",    limit: 4,               comment: "マナ回収"
    t.integer  "get_ap",      limit: 4,               comment: "AP回収"
    t.integer  "need_coin",   limit: 4,               comment: "必要コイン"
    t.integer  "need_seisho", limit: 4,               comment: "必要聖書"
    t.integer  "position_x",  limit: 4,  null: false, comment: "設置場所X"
    t.integer  "position_y",  limit: 4,  null: false, comment: "設置場所Y"
    t.datetime "regist_time",            null: false, comment: "登録日時"
    t.datetime "update_time",            null: false, comment: "更新日時"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "skill_master", id: :integer, limit: 8, comment: "スキルマスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image_no",     limit: 8,     null: false, comment: "画像番号"
    t.integer  "kbn",          limit: 4,     null: false, comment: "区分"
    t.integer  "type",         limit: 4,     null: false, comment: "タイプ"
    t.string   "name",         limit: 32,    null: false, comment: "名前"
    t.text     "info",         limit: 65535, null: false, comment: "説明"
    t.integer  "cost",         limit: 4,     null: false, comment: "コスト"
    t.integer  "zokusei",      limit: 4,     null: false, comment: "属性"
    t.integer  "ap",           limit: 4,     null: false, comment: "AP"
    t.integer  "kaisu",        limit: 4,     null: false, comment: "回数"
    t.integer  "taisyo",       limit: 4,     null: false, comment: "対象"
    t.integer  "taisyo_min",   limit: 4,     null: false, comment: "最小対象数"
    t.integer  "taisyo_max",   limit: 4,     null: false, comment: "最大対象数"
    t.float    "bairitsu",     limit: 24,                 comment: "倍率"
    t.float    "kou_zougen",   limit: 24,                 comment: "物攻増減"
    t.float    "bou_zougen",   limit: 24,                 comment: "物防増減"
    t.float    "makou_zougen", limit: 24,                 comment: "魔攻増減"
    t.float    "mabou_zougen", limit: 24,                 comment: "魔防増減"
    t.datetime "start_time",                 null: false, comment: "公開開始日時"
    t.datetime "end_time",                   null: false, comment: "公開終了日時"
    t.datetime "regist_time",                null: false, comment: "登録日時"
    t.datetime "update_time",                null: false, comment: "更新日時"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "unit", id: :integer, limit: 8, comment: "ユニットテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",            limit: 8, null: false, comment: "ユーザーID"
    t.integer  "unit_master_id",     limit: 8, null: false, comment: "ユニットマスタID"
    t.integer  "star",               limit: 4, null: false, comment: "星"
    t.integer  "level_max",          limit: 4, null: false, comment: "最大レベル"
    t.integer  "level",              limit: 4, null: false, comment: "レベル"
    t.integer  "exp",                limit: 4, null: false, comment: "経験値"
    t.integer  "kou",                limit: 4, null: false, comment: "攻撃力"
    t.integer  "bou",                limit: 4, null: false, comment: "防御力"
    t.integer  "zenei_skill_id1",    limit: 8,              comment: "前衛スキルID1"
    t.integer  "zenei_skill_level1", limit: 4,              comment: "前衛スキルレベル1"
    t.integer  "zenei_skill_kbn1",   limit: 4,              comment: "前衛スキル区分1"
    t.integer  "zenei_skill_id2",    limit: 8,              comment: "前衛スキルID2"
    t.integer  "zenei_skill_level2", limit: 4,              comment: "前衛スキルレベル2"
    t.integer  "zenei_skill_kbn2",   limit: 4,              comment: "前衛スキル区分2"
    t.integer  "koei_skill_id1",     limit: 8,              comment: "後衛スキルID1"
    t.integer  "koei_skill_level1",  limit: 4,              comment: "後衛スキルレベル1"
    t.integer  "koei_skill_kbn1",    limit: 4,              comment: "後衛スキル区分1"
    t.integer  "koei_skill_id2",     limit: 8,              comment: "後衛スキルID2"
    t.integer  "koei_skill_level2",  limit: 4,              comment: "後衛スキルレベル2"
    t.integer  "koei_skill_kbn2",    limit: 4,              comment: "後衛スキル区分2"
    t.integer  "leader_skill_id",    limit: 8,              comment: "リーダースキルID"
    t.integer  "leader_skill_level", limit: 4,              comment: "リーダースキルレベル"
    t.integer  "leader_skill_kbn",   limit: 4,              comment: "リーダースキル区分"
    t.datetime "regist_time",                  null: false, comment: "登録日時"
    t.datetime "update_time",                  null: false, comment: "更新日時"
    t.integer  "delflg",             limit: 4, null: false, comment: "削除フラグ"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "unit_master", id: :integer, limit: 8, comment: "ユニットマスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "no",                     limit: 8,     null: false, comment: "番号"
    t.string   "image_no",               limit: 8,     null: false, comment: "画像番号"
    t.integer  "rare",                   limit: 4,     null: false, comment: "レア度"
    t.integer  "level_max",              limit: 4,     null: false, comment: "初期最大レベル"
    t.string   "name",                   limit: 32,    null: false, comment: "名前"
    t.text     "info",                   limit: 65535, null: false, comment: "説明"
    t.integer  "zokusei",                limit: 4,     null: false, comment: "属性"
    t.integer  "type",                   limit: 4,     null: false, comment: "タイプ"
    t.integer  "cost",                   limit: 4,     null: false, comment: "コスト"
    t.integer  "kou",                    limit: 4,     null: false, comment: "攻撃力"
    t.integer  "bou",                    limit: 4,     null: false, comment: "防御力"
    t.integer  "zenei_skill_id1",        limit: 8,                  comment: "前衛スキルID1"
    t.integer  "zenei_skill_level1",     limit: 4,                  comment: "前衛スキルレベル1"
    t.integer  "zenei_skill_kbn1",       limit: 4,                  comment: "前衛スキル区分1"
    t.integer  "zenei_skill_id2",        limit: 8,                  comment: "前衛スキルID2"
    t.integer  "zenei_skill_level2",     limit: 4,                  comment: "前衛スキルレベル2"
    t.integer  "zenei_skill_kbn2",       limit: 4,                  comment: "前衛スキル区分2"
    t.integer  "koei_skill_id1",         limit: 8,                  comment: "後衛スキルID1"
    t.integer  "koei_skill_level1",      limit: 4,                  comment: "後衛スキルレベル1"
    t.integer  "koei_skill_kbn1",        limit: 4,                  comment: "後衛スキル区分1"
    t.integer  "koei_skill_id2",         limit: 8,                  comment: "後衛スキルID2"
    t.integer  "koei_skill_level2",      limit: 4,                  comment: "後衛スキルレベル2"
    t.integer  "koei_skill_kbn2",        limit: 4,                  comment: "後衛スキル区分2"
    t.integer  "leader_skill_id",        limit: 8,                  comment: "リーダースキルID"
    t.integer  "leader_skill_level",     limit: 4,                  comment: "リーダースキルレベル"
    t.integer  "leader_skill_kbn",       limit: 4,                  comment: "リーダースキル区分"
    t.datetime "gatya_muryo_start_time",               null: false, comment: "無料ガチャ公開開始日時"
    t.datetime "gatya_muryo_end_time",                 null: false, comment: "無料ガチャ公開終了日時"
    t.datetime "gatya_kakin_start_time",               null: false, comment: "課金ガチャ公開開始日時"
    t.datetime "gatya_kakin_end_time",                 null: false, comment: "課金ガチャ公開終了日時"
    t.datetime "regist_time",                          null: false, comment: "登録日時"
    t.datetime "update_time",                          null: false, comment: "更新日時"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "update_master", id: :integer, limit: 8, comment: "更新マスタ", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "no",         limit: 4,     null: false, comment: "バージョン"
    t.text     "naiyo",      limit: 65535, null: false, comment: "更新内容"
    t.datetime "start_time",               null: false, comment: "開始日時"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user", id: :integer, limit: 8, comment: "ユーザーテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",             limit: 32, null: false, comment: "ユーザー名"
    t.integer  "girudo_id",        limit: 8,               comment: "ギルドID"
    t.integer  "shotai_id",        limit: 8,  null: false, comment: "招待ID"
    t.integer  "shotai_su",        limit: 4,  null: false, comment: "招待数"
    t.integer  "level",            limit: 4,  null: false, comment: "レベル"
    t.integer  "exp",              limit: 8,  null: false, comment: "経験値"
    t.integer  "coin",             limit: 8,  null: false, comment: "コイン"
    t.integer  "mana_p",           limit: 8,  null: false, comment: "マナP"
    t.integer  "crystal_kakin",    limit: 8,  null: false, comment: "課金クリスタル"
    t.integer  "crystal_muryo",    limit: 8,  null: false, comment: "無料クリスタル"
    t.integer  "premium_p",        limit: 8,  null: false, comment: "プレミアムP"
    t.integer  "seisyo",           limit: 8,  null: false, comment: "聖書"
    t.integer  "fvko",             limit: 8,  null: false, comment: "FV粉"
    t.integer  "unit_max",         limit: 4,  null: false, comment: "キャラ最大数"
    t.integer  "huriwaike_p",      limit: 4,  null: false, comment: "振り分けP"
    t.integer  "unit_cost",        limit: 4,  null: false, comment: "キャラコスト"
    t.integer  "skill_cost",       limit: 4,  null: false, comment: "スキルコスト"
    t.integer  "stamina",          limit: 4,  null: false, comment: "スタミナ"
    t.integer  "stamina_max",      limit: 4,  null: false, comment: "最大スタミナ"
    t.integer  "ap",               limit: 4,  null: false, comment: "AP"
    t.integer  "ap_max",           limit: 4,  null: false, comment: "最大AP"
    t.integer  "koei_flg",         limit: 4,  null: false, comment: "後衛希望フラグ"
    t.datetime "final_login_time",            null: false, comment: "最終ログイン日時"
    t.integer  "renzoku_login",    limit: 4,  null: false, comment: "連続ログイン"
    t.integer  "total_login",      limit: 4,  null: false, comment: "合計ログイン"
    t.integer  "kouken_p",         limit: 8,  null: false, comment: "ギルド貢献P"
    t.integer  "battle_su",        limit: 4,  null: false, comment: "開催バトル数"
    t.integer  "battle_sanka_su",  limit: 4,  null: false, comment: "バトル参加数"
    t.datetime "regist_time",                 null: false, comment: "登録日時"
    t.datetime "update_time",                 null: false, comment: "更新日時"
    t.integer  "account_stop_flg", limit: 4,  null: false, comment: "アカウント停止フラグ"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "user_battle", id: :integer, limit: 8, comment: "ユーザーバトルテーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",        limit: 4, null: false, comment: "ユーザーID"
    t.string   "image_no",       limit: 8, null: false, comment: "画像番号"
    t.integer  "zokusei",        limit: 4, null: false, comment: "属性"
    t.integer  "hp",             limit: 4, null: false, comment: "HP"
    t.integer  "hp_max",         limit: 4, null: false, comment: "最大HP"
    t.integer  "sou_senryoku",   limit: 4, null: false, comment: "総戦力"
    t.integer  "sou_kou",        limit: 4, null: false, comment: "総物攻"
    t.integer  "sou_bou",        limit: 4, null: false, comment: "総物防"
    t.integer  "sou_makou",      limit: 4, null: false, comment: "総魔攻"
    t.integer  "sou_mabou",      limit: 4, null: false, comment: "総魔防"
    t.integer  "kou_zougenti",   limit: 4,              comment: "物攻増減値"
    t.integer  "bou_zougenti",   limit: 4,              comment: "物防増減値"
    t.integer  "makou_zougenti", limit: 4,              comment: "魔攻増減値"
    t.integer  "mabou_zougenti", limit: 4,              comment: "魔防増減値"
    t.integer  "sanka_flg",      limit: 4, null: false, comment: "参加中フラグ"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_setting", id: :integer, limit: 8, comment: "ユーザー設定テーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "se_onryo",          limit: 4, null: false, comment: "SE音量"
    t.integer  "bgm_onryo",         limit: 4, null: false, comment: "BGM音量"
    t.integer  "db_version",        limit: 4, null: false, comment: "DBバージョン"
    t.integer  "push_start_10_flg", limit: 4, null: false, comment: "ギルドバトル開始10分前通知"
    t.integer  "push_start_flg",    limit: 4, null: false, comment: "ギルドバトル開始通知"
    t.integer  "push_end_10_flg",   limit: 4, null: false, comment: "ギルドバトル終了10分前通知"
    t.integer  "push_end_flg",      limit: 4, null: false, comment: "ギルドバトル終了通知"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "user_shikibetsu", id: :integer, limit: 8, comment: "ユーザー識別テーブル", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",            limit: 8,  null: false, comment: "ユーザーID"
    t.string   "user_shikibetsu_id", limit: 64, null: false, comment: "ユーザー識別ID"
    t.string   "kishu_info",         limit: 64,              comment: "機種情報"
    t.integer  "update_version",     limit: 4,  null: false, comment: "更新バージョン"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
