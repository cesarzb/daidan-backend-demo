Sequel.migration do
    change do
      alter_table(:users) do
        add_column :password_digest, String, null: false
      end
    end
  end
  