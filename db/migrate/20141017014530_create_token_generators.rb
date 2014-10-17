class CreateTokenGenerators < ActiveRecord::Migration
  def change
    create_table :token_generators do |t|

      t.timestamps
    end
  end
end
