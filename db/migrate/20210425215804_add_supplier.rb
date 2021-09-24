class AddSupplier < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.references :addressable, type: :binary, polymorphic: true, null: false, index: true
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.string :references
      t.string :zip_code
      t.string :custom_address
      t.boolean :is_primary
      t.timestamps
    end

    create_table :suppliers, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :company_name
      t.string :description
      t.string :phone_country_code
      t.string :phone_number
      t.string :email
      t.references :user, type: :binary, foreign_key: true, index: true, null: false
    end

    create_table :services, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :name, null: false
      t.string :description
      t.references :supplier, type: :binary, foreign_key: true, index: true, null: false
      t.jsonb :custom_features
      t.decimal :price, precision: 20, scale: 2
      t.boolean :is_home_service, default: false, null: false
      t.timestamps
    end
    
    create_enum :appointments_status_types, %w[scheduled started finished canceled]
    create_table :appointments, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.references :created_by, type: :binary, foreign_key: { to_table: 'users' }, index: true, null: false
      t.references :canceled_by, type: :binary, foreign_key: { to_table: 'users' }, index: true
      t.references :service, type: :binary, foreign_key: true, index: true, null: false
      t.datetime :canceled_at
      t.datetime :date_at
      t.enum :status, enum_name: :appointments_status_types, default: :scheduled
      t.timestamps
    end

    create_table :purchases, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.references :service, type: :binary, foreign_key: true, index: true, null: false
      t.decimal :total, precision: 20, scale: 2
      t.decimal :subtotal, precision: 20, scale: 2
      t.timestamps
    end


    create_table :purchase_items, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.references :service, type: :binary, foreign_key: true, index: true, null: false
      t.integer :quantity
      t.decimal :price, precision: 20, scale: 2
      t.timestamps
    end
  end
end
