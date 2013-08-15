require 'spec_helper'

feature 'Search twitter for a term' do
  scenario 'search by a hashtag' do
    search_for('Rails')
    user_sees_tweet(15, '#Rails')
  end

  scenario 'searching with know results' do
    Searcher.searcher = FakeTwitter
    FakeTwitter['#Rails'] = 3.times.map {{text: 'Testing is awsome'}}
    search_for('Rails')
    user_sees_tweet(3, 'Testing is awsome')
  end


  def search_for(term)
    visit root_path
    fill_in 'Search', with: term
    click_button 'Search'
  end

  def user_sees_tweet(count, text)
    expect(page).to have_css 'li.tweet', count: count

    all('li.tweet').each do |tweet|
      expect(tweet.text).to match /#{text}/i
    end
  end
end