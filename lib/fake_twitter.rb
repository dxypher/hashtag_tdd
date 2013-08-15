class FakeTwitter
  def self.search(term)
    OpenStruct.new(results: @results.fetch(term) {[]})
  end

  def self.[]=(key, value)
    @results ||= {}
    @results[key] = value.map {|twitter_hash| Twitter::Status.new(twitter_hash.merge(id:1123))}
  end

  def self.clear
    @results = {}
  end
end