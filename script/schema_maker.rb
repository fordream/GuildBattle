require "pry"
require "roo"

class SchemaMaker

  def initialize(file_path)
    # エクセルを読む
    readed = read_excel file_path
    # 出力
    put_schema(readed)
  end

  private

  def read_excel(file_path)
    readed = []

    xlsx = Roo::Excelx.new(file_path)
    xlsx.sheets.each_with_index do |sheet, sheet_no|
      next if sheet_no < 2 # 0, 1シート目はスキップ

      table_info          = {}
      table_info[:column] = []
      row_no              = 0
      xlsx.sheet_for(sheet).each_row do |row|
        row_no = row_no + 1
        case row_no
          when 1 # テーブル名
            table_info[:table_name_jp] = row[1].value
          when 2 # テーブル物理名
            table_info[:table_name] = row[1].value
          when 3 # テーブルコメント
            table_info[:table_comment] = row[1].value
          else
            next if is_blank(row[0]) || is_blank(row[1]) || is_blank(row[2]) # 項目名、物理名、型のいずれかがブランク
            next if /[A-Z0-9_]+/.match(row[1].value) == nil

            table_info[:column] << {
              name_jp:    row[0].value,
              name:       row[1].value,
              type:       row[2].value,
              constraint: row[3].value
            }
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
      schema_str << "create_table :#{s[:table_name]}, id: :bigint, comment: \"#{s[:table_name_jp]}\", force: :cascade do |t|\n"
      s[:column].each do |c|
        put_column(schema_str, c)
      end
      schema_str << "  t.timestamps null: false\n"
      schema_str << "end\n\n"
    end
    File.write('script/_schema.rb', schema_str)
  end

  private

  def put_column(put_str, column)
    # IDは無視
    return if column[:name] == "ID"
    # not nullを付けるかどうか
    not_null = (column[:constraint] == 'NOT NULL' ? ', null: false' : '')

    case column[:type]
      when "BIGINT"
        put_str << "  t.integer :#{column[:name]}, :limit => 8#{not_null}, comment: \"#{column[:name_jp]}\""
      when "INT"
        put_str << "  t.integer :#{column[:name]}#{not_null}, comment: \"#{column[:name_jp]}\""
      when "TINYINT"
        put_str << "  t.boolean :#{column[:name]}#{not_null}, comment: \"#{column[:name_jp]}\""
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
          binding.pry
          raise "#{column[:type]} is not support."
        end
    end
    put_str << "\n"
  end

end

# Run
SchemaMaker.new File.dirname(__FILE__) + '/データ構造0527.xlsx'