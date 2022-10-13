class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon, default: "https://i.ibb.co/GMbr63g/paper-bill-transaction-receipt-payment-260nw-1956128284.png"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
