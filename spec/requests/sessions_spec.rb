require 'spec_helper'

describe 'Sessions' do
  before do
    @user = User.make!
  end

  def sign_in(user)
    visit new_session_path
    within('#new_session') do
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_on I18n.t('sessions.sign_in')
    end
  end

  describe 'signing in' do
    context 'with valid credentials' do
      it 'should sign the user in' do
        sign_in(@user)
        expect(page).to have_content(I18n.t('sessions.welcome_username', username: @user.username))
      end
    end

    context 'without valid credentials' do
      it 'should sign the user in' do
        visit new_session_path
        within('#new_session') do
          fill_in 'Username', with: @user.username
          fill_in 'Password', with: @user.password.reverse
          click_on I18n.t('sessions.sign_in')
        end
        expect(page).not_to have_content(I18n.t('sessions.welcome_username', username: @user.username))
      end
    end
  end

  describe 'signing out' do
    it 'should sign the user out', js: true do
      sign_in(@user)
      visit root_path
      click_link I18n.t('sessions.sign_out')
      expect(page).to have_content(I18n.t('sessions.youve_been_signed_out'))
    end
  end
end
