require 'spec_helper'

describe Searcher, '#results' do
  it "return results from a twitter search" do
    searcher = Searcher.new('ruby')
    expect(searcher.results.length).to eq 15
  end
end