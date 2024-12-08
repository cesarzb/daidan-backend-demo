require_relative 'database'
require 'bcrypt'

DB[:expenditures].truncate if DB.tables.include?(:expenditures)
DB[:users].truncate if DB.tables.include?(:users)

def hash_password(password)
  BCrypt::Password.create(password)
end

alice_password = hash_password('password123')
bob_password = hash_password('securepassword')

alice_id = DB[:users].insert(name: 'Alice', email: 'alice@example.com', password_digest: alice_password)
bob_id = DB[:users].insert(name: 'Bob', email: 'bob@example.com', password_digest: bob_password)

puts "Inserted users: Alice (ID: #{alice_id}), Bob (ID: #{bob_id})"

DB[:expenditures].insert(user_id: alice_id, name: 'Candies', cost: 1.5)
DB[:expenditures].insert(user_id: alice_id, name: 'Cleaning supplies', cost: 4.5)

DB[:expenditures].insert(user_id: bob_id, name: 'Coffee', cost: 3.0)
DB[:expenditures].insert(user_id: bob_id, name: 'Lunch', cost: 12.0)

puts 'Inserted expenditures for Alice and Bob.'
