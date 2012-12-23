require 'spec_helper'

describe 'Pledges' do
  describe 'create' do
    before do
      sign_in
      @bounty = Bounty.make!
    end

    let(:amount) { '64d' }
    let(:comment) { Forgery::Basic.text }

    it 'posts a pledge to a bounty' do
      visit bounty_path(@bounty)
      within('#new_pledge') do
        fill_in 'Amount', with: amount
        fill_in 'Comment', with: comment
        click_button I18n.t('pledges.post')
      end
      expect(page).to have_content(amount)
      expect(page).to have_content(comment)
    end
  end
end
