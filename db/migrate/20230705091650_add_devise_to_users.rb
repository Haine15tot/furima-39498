# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def self.up
    # Comment out or remove the line that adds the 'email' column
    # add_column :users, :email, :string
  end

  def self.down
    # Uncomment or add back the line to remove the 'email' column
    # remove_column :users, :email
  end
end