require "pry"
require "roo"
require "active_support"

class SchemaMaker

  def initialize(file_path)
    # エクセルを読む
    readed = read_excel file_path
    # スキーマ出力
    put_schema(readed)
    # モデル出力
    put_model(readed)
  end

  private

  def read_excel(file_path)
    readed = []

    xlsx = Roo::Excelx.new(file_path)
    xlsx.sheets.each_with_index do |sheet, sheet_no|
      next if sheet_no < 2 # 0, 1シート目はスキップ

      table_info = {}
      row_no     = 0
      xlsx.sheet_for(sheet).each_row do |row|
        row_no = row_no + 1
        case row_no
          when 1 # テーブル名
            table_info[:table_name_jp] = row[1].value
          when 2 # テーブル物理名
            table_info[:table_name] = row[1].value.downcase
          when 3 # テーブルコメント
            table_info[:table_comment] = row[1].value
          else
            next if is_blank(row[0]) || is_blank(row[1]) || is_blank(row[2]) # 項目名、物理名、型のいずれかがブランク
            next if /[A-Z0-9_]+/.match(row[1].value) == nil

            table_info[:column] ||= []
            table_info[:column] << {
              name_jp:    row[0].value,
              name:       row[1].value.downcase,
              type:       row[2].value,
              constraint: row[3].value
            }

            # typeカラムが存在している場合、あとでmodelのinheritance_columnをいじる
            if row[1].value.downcase == 'type'
              table_info[:exists_type] = true
            end
        end
      end
      readed << table_info
    end
    readed
  end

  def is_blank(obj)
    obj == nil || obj.value == nil || obj.value == ''
  end

  def put_schema(readed)
    schema_str = ''
    readed.each do |s|
      schema_str << "create_table :#{s[:table_name]}, id: false, comment: \"#{s[:table_name_jp]}\", force: :cascade do |t|\n"
      s[:column].each do |c|
        put_column(schema_str, c)
      end
      schema_str << "  t.timestamps null: false\n"
      schema_str << "end\n\n"
    end
    File.write('script/_schema.rb', schema_str)
  end

  def put_model(readed)
    output_dir = 'script/models/'
    FileUtils.mkdir_p(output_dir) # ディレクトリ作成
    readed.each do |s|
      class_name = s[:table_name].downcase
      model_str  = "class #{ActiveSupport::Inflector.classify class_name} < ActiveRecord::Base\n"

      # カラムに "type" が含まれているか
      if s[:exists_type] == true
        model_str << "  self.inheritance_column = :escape_from_type\n"
      end

      model_str << "  self.table_name = '#{s[:table_name]}'\n"
      model_str << "\n"
      model_str << "  include Garage::Representer\n"
      model_str << "  include Garage::Authorizable\n"
      model_str << "\n"
      s[:column].each do |c|
        model_str << "  property :#{c[:name]} # #{c[:name_jp]}\n" unless c[:name] == 'id'
      end
      model_str << "\n"
      model_str << "  def self.build_permissions(perms, other, target)\n"
      #model_str << "    perms.permits! :write\n"
      model_str << "    perms.permits! :read\n"
      model_str << "  end\n"
      model_str << "\n"
      model_str << "  def build_permissions(perms, other)\n"
      #model_str << "    perms.permits! :write\n"
      model_str << "    perms.permits! :read\n"
      model_str << "  end\n"
      model_str << "\n"
      model_str << "end"

      File.write(output_dir + s[:table_name] + '.rb', model_str)
    end
  end

  private

  def put_column(put_str, column)
    if column[:name].upcase == "ID"
      # IDは別の処理
      put_str << "  t.column :id, 'BIGINT PRIMARY KEY AUTO_INCREMENT'"
    else
      # ID以外
      # not nullを付けるかどうか
      not_null = (column[:constraint] == 'NOT NULL' ? ', null: false' : '')

      case column[:type]
        when "BIGINT"
          put_str << "  t.integer :#{column[:name]}, :limit => 8#{not_null}, comment: \"#{column[:name_jp]}\""
        when "INT"
          put_str << "  t.integer :#{column[:name]}#{not_null}, comment: \"#{column[:name_jp]}\""
        when "TINYINT"
          put_str << "  t.integer :#{column[:name]}#{not_null}, comment: \"#{column[:name_jp]}\""
        when "TIMESTAMP"
          put_str << "  t.timestamp :#{column[:name]}#{not_null}, comment: \"#{column[:name_jp]}\""
        when "TEXT"
          put_str << "  t.text :#{column[:name]}#{not_null}, comment: \"#{column[:name_jp]}\""
        when "FLOAT"
          put_str << "  t.float :#{column[:name]}#{not_null}, comment: \"#{column[:name_jp]}\""
        else
          if column[:type] =~ /VARCHAR.*/
            char_length = column[:type].gsub(/[^0-9]/, "").to_i
            put_str << "  t.string :#{column[:name]}, :limit => #{char_length}#{not_null}, comment: \"#{column[:name_jp]}\""
          else
            raise "#{column[:type]} is not support."
          end
      end
    end
    put_str << "\n"
  end

end

# Run
SchemaMaker.new File.dirname(__FILE__) + '/データ構造0527.xlsx'
