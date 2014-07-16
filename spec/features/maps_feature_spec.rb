require 'rails_helper'

describe 'maps' do
  context 'posts with addresses' do
    let(:alex) {create(:user)}
    before do
      alex.posts.create(title: 'Cool post', description: 'Hello world', address: '25 City Road, London')
    end

    it 'displays a map', js: true do
      visit '/posts'
      click_link 'Map'
      expect(page).to have_map
      # expect(page).to have_css '.gm-style'
    end
  end
end