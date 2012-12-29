class RemoveUserIdFromPledges < ActiveRecord::Migration
  def up
    remove_column :pledges, :user_id
  end

  def down
    add_column :pledges, :user_id
    say_with_time 'Rebuilding pledge user_ids' do
      Pledge.all.each do |pledge|
        pledge.update_attribute :user_id, User.where(username: pledge.username).first.id
      end
    end
  end
end
