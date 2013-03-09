class ChangeUserIdToUsernameOnPledges < ActiveRecord::Migration
  class Pledge < ActiveRecord::Base
  end

  def up
    add_column :pledges, :username, :string

    say_with_time 'Getting usernames from user.username' do
      Pledge.all.each do |pledge|
        pledge.update_attribute :username, pledge.user.username
      end
    end
  end

  def down
    remove_column :pledges, :username
  end
end
