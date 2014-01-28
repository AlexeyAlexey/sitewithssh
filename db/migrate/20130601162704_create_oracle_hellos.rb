class CreateOracleHellos < ActiveRecord::Migration
  def change
    create_table :oracle_hellos do |t|

      t.timestamps
    end
  end
end
