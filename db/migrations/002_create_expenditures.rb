Sequel.migration do
  change do
    create_table(:expenditures) do
      primary_key :id
      foreign_key :user_id, :users, null: false, on_delete: :cascade
      String :name, null: false
      Decimal :cost, size: [10, 2], null: false
    end
  end
end
