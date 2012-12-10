require 'spec_helper'

describe 'Reports' do
  describe 'creating' do
    let!(:shop) { Shop.make! }

    it 'increments the reports count', js: true do
      visit shops_path
      within "#shop_#{shop.id}" do
        click_on I18n.t('reports.report')
        expect(find('.reports')).to have_content(1)
      end
    end
  end
end
