require 'sequel'
require 'yaml'

config_path = File.expand_path('../config/database.yml', __dir__)
db = YAML.load_file(config_path)[:database]
DB = Sequel.sqlite(db)

unless DB.table_exists?(:users)
  DB.create_table :users do
    primary_key :id
    String :name
    String :email
  end

  DB[:users].insert(name: 'Alice', email: 'alice@example.com')
  DB[:users].insert(name: 'Bob', email: 'bob@example.com')
end

unless DB.table_exists?(:expenditures)
  DB.create_table :expenditures do
    primary_key :id
    foreign_key :user_id
    String :name
    Decimal :cost
  end

  DB[:expenditures].insert(user_id: DB[:users].first[:id], name: 'Candies', cost: 1.5)
  DB[:expenditures].insert(user_id: DB[:users].first[:id], name: 'Cleaning supplies', cost: 4.5)
end
