class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :install

      t.timestamps
    end
  end
end
