class AddConfirmableToTeachers < ActiveRecord::Migration
  # Note: You can't use change, as Teacher.update_all with fail in the down migration
  def self.up
    add_column :teachers, :confirmation_token, :string
    add_column :teachers, :confirmed_at, :datetime
    add_column :teachers, :confirmation_sent_at, :datetime
    # add_column :teachers, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :teachers, :confirmation_token, :unique => true
    # Teacher.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # teachers as confirmed, do the following
    Teacher.update_all(:confirmed_at => Time.now)
    # All existing user accounts should be able to log in after this.
  end

  def self.down
    remove_column :teachers, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_column :teachers, :unconfirmed_email # Only if using reconfirmable
  end
end
