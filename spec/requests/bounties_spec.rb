require 'spec_helper'

describe 'Bounties' do
  describe 'index' do
    before do
      @bounty = Bounty.make!
    end

    it 'lists bounties' do
      visit bounties_path
      expect(page).to have_content(@bounty.username)
    end
  end

  describe 'show' do
    before do
      @bounty = Bounty.make!
      @pledge = Pledge.make!(bounty: @bounty)
    end

    it "it lists the bounty's pledges" do
      visit bounty_path(@bounty)
      expect(page).to have_content(@pledge.amount)
      expect(page).to have_content(@pledge.comment)
    end
  end

  describe 'create' do
    before do
      sign_in
    end

    let(:username) { Forgery::Internet.user_name }
    let(:amount) { '64d' }
    let(:comment) { Forgery::Basic.text }

    def create_bounty
      visit bounties_path
      click_on I18n.t('bounties.new_bounty')
      fill_in 'Username', with: username
      fill_in 'Amount', with: amount
      fill_in 'Comment', with: comment
      click_button I18n.t('bounties.post_bounty')
    end

    context 'when there is no current boutny for the user' do
      it 'should post a new bounty', js: true do
        create_bounty
        expect(page).to have_content(username)
        expect(page).to have_content(amount)
        expect(page).to have_content(comment)
      end
    end

    context 'when there is a current boutny for the user' do
      before do
        @bounty = Bounty.make!(username: username)
      end

      it 'should add a pledge to the bounty', js: true do
        create_bounty
        visit bounty_path(@bounty)
        expect(page).to have_content(username)
        expect(page).to have_content(amount)
        expect(page).to have_content(comment)
      end
    end
  end
end
