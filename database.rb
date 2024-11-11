require 'sequel'

DB = Sequel.sqlite

unless DB.table_exists?(:users)
  DB.create_table :users do
    primary_key :id
    String :name
    String :email
  end

  DB[:users].insert(name: 'Alice', email: 'alice@example.com')
  DB[:users].insert(name: 'Bob', email: 'bob@example.com')
end
