require 'rails_helper'

describe 'liking posts' do
  let(:alex) {create(:user)}
  before do
    alex.posts.create(title: 'Cool post', description: 'Hello world')
  end

  it 'is initially at 0 likes' do
    visit '/posts'
    expect(page).to have_link '❤ 0'
  end

  xit 'can be liked, incrementing the likes count', js: true do
    visit '/posts'
    click_link '❤ 0'
    sleep 2
    expect(page).to have_link '❤ 1'
  end

  it 'can only be liked once per user', js:true do
    login_as alex
    visit '/posts'
    click_link '❤ 0'
    sleep 2
    click_link '❤ 1'
    sleep 2
    expect(page).to have_link '❤ 1'
  end


end
