describe "SerpApi Local Sellers JSON" do

  describe "Local sellers for Sceptre X505BV-FSR - 50 LED TV - 1080p" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?engine=google_product&product=16618293882053925702&sellers=local&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

  end

end