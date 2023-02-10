# frozen_string_literal: true

class CreateChirps < ActiveRecord::Migration[7.0]
  def change
    create_table(:chirps) do |t|
      t.string(:content)
      t.references(:user, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
