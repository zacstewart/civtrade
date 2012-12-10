require 'spec_helper'

describe 'Shops' do
  describe 'creating' do
    context 'a sell-only shop' do
      it 'adds the shop to the directory' do
        visit shops_path
        click_on I18n.t('shops.new_shop')
        fill_in 'Item', with: 'Iron Ingot'
        fill_in 'Sell amount', with: Forgery::Basic.number
        fill_in 'Sell price', with: Forgery::Basic.number
        select 'c', from: 'Sell currency'
        select 'Overworld', from: 'World'
        fill_in 'Location x', with: Forgery::Basic.number
        fill_in 'Location y', with: Forgery::Basic.number
        fill_in 'Location z', with: Forgery::Basic.number
        click_on I18n.t('shops.list_shop')
        expect(page).to have_content('Iron Ingot')
      end
    end

    context 'a buy-only shop' do
      it 'adds the shop to the directory' do
        visit shops_path
        click_on I18n.t('shops.new_shop')
        fill_in 'Item', with: 'Iron Ingot'
        fill_in 'Buy amount', with: Forgery::Basic.number
        fill_in 'Buy price', with: Forgery::Basic.number
        select 'c', from: 'Buy currency'
        select 'Overworld', from: 'World'
        fill_in 'Location x', with: Forgery::Basic.number
        fill_in 'Location y', with: Forgery::Basic.number
        fill_in 'Location z', with: Forgery::Basic.number
        click_on I18n.t('shops.list_shop')
        expect(page).to have_content('Iron Ingot')
      end
    end

    context 'with an invalid currency' do
      it 'does not add the shop to the directory' do
        visit shops_path
        click_on I18n.t('shops.new_shop')
        fill_in 'Item', with: 'Iron Ingot'
        fill_in 'Buy amount', with: Forgery::Basic.number
        fill_in 'Buy price', with: Forgery::Basic.number
        select '', from: 'Buy currency'
        select 'Overworld', from: 'World'
        fill_in 'Location x', with: Forgery::Basic.number
        fill_in 'Location y', with: Forgery::Basic.number
        fill_in 'Location z', with: Forgery::Basic.number
        click_on I18n.t('shops.list_shop')
        expect(page).not_to have_content('Iron Ingot')
      end
    end
  end
end
