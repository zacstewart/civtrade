class AddStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state, :string
    say_with_time 'setting all user state to unverified' do
      User.update_all(state: 'unverified')
    end
  end
end
