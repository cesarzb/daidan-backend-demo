require_relative 'database'

DB.tables.each do |table|
  DB.drop_table(table)
end

puts 'All tables dropped successfully.'
