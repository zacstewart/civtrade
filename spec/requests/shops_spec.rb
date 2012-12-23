require 'spec_helper'

describe 'Shops' do
  describe 'creating' do
    before do
      @item = Item.make!
    end

    def create_shop
      visit shops_path
      click_on I18n.t('shops.new_shop')
      fill_in 'Item', with: @item.name
      fill_in 'Sell amount', with: Forgery::Basic.number
      fill_in 'Sell price', with: Forgery::Basic.number
      select 'c', from: 'Sell currency'
      fill_in 'Buy amount', with: Forgery::Basic.number
      fill_in 'Buy price', with: Forgery::Basic.number
      select 'c', from: 'Buy currency'
      fill_in 'City', with: 'Aristopolis'
      select 'Overworld', from: 'World'
      fill_in 'Location x', with: Forgery::Basic.number
      fill_in 'Location y', with: Forgery::Basic.number
      fill_in 'Location z', with: Forgery::Basic.number
      click_on I18n.t('shops.list_shop')
    end

    it 'adds the shop to the directory' do
      create_shop
      expect(page).to have_content(@item.name)
    end

    it "has a link to its item's page" do
      create_shop
      expect(page).to have_link(@item.name)
    end

    it "adds the shop to the item's page" do
      create_shop
      visit item_path(@item)
      expect(page).to have_content(@item.name)
    end

    context 'a sell-only shop' do
      it 'adds the shop to the directory' do
        visit shops_path
        click_on I18n.t('shops.new_shop')
        fill_in 'Item', with: @item.name
        fill_in 'Sell amount', with: Forgery::Basic.number
        fill_in 'Sell price', with: Forgery::Basic.number
        select 'c', from: 'Sell currency'
        fill_in 'City', with: 'Aristopolis'
        select 'Overworld', from: 'World'
        fill_in 'Location x', with: Forgery::Basic.number
        fill_in 'Location y', with: Forgery::Basic.number
        fill_in 'Location z', with: Forgery::Basic.number
        click_on I18n.t('shops.list_shop')
        expect(page).to have_content(@item.name)
      end
    end

    context 'a buy-only shop' do
      it 'adds the shop to the directory' do
        visit shops_path
        click_on I18n.t('shops.new_shop')
        fill_in 'Item', with: @item.name
        fill_in 'Buy amount', with: Forgery::Basic.number
        fill_in 'Buy price', with: Forgery::Basic.number
        select 'c', from: 'Buy currency'
        select 'Overworld', from: 'World'
        fill_in 'Location x', with: Forgery::Basic.number
        fill_in 'Location y', with: Forgery::Basic.number
        fill_in 'Location z', with: Forgery::Basic.number
        click_on I18n.t('shops.list_shop')
        expect(page).to have_content(@item.name)
      end
    end

    context 'with an invalid currency' do
      it 'does not add the shop to the directory' do
        visit shops_path
        click_on I18n.t('shops.new_shop')
        fill_in 'Item', with: @item.name
        fill_in 'Buy amount', with: Forgery::Basic.number
        fill_in 'Buy price', with: Forgery::Basic.number
        select '', from: 'Buy currency'
        select 'Overworld', from: 'World'
        fill_in 'Location x', with: Forgery::Basic.number
        fill_in 'Location y', with: Forgery::Basic.number
        fill_in 'Location z', with: Forgery::Basic.number
        click_on I18n.t('shops.list_shop')
        expect(page).not_to have_content(@item.name)
      end
    end
  end
end
