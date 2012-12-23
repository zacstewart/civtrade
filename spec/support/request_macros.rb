module RequestMacros
  def sign_in(user=User.make!)
    visit new_session_path
    within('#new_session') do
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_on I18n.t('sessions.sign_in')
    end
  end
end

RSpec.configure do |config|
  config.include RequestMacros, :type => :request
end
