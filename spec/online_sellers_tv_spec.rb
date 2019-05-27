describe "SerpApi Online Sellers JSON" do

  describe "Online sellers for Sceptre X505BV-FSR - 50 LED TV - 1080p" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?engine=google_product&product_id=16618293882053925702&sellers=online&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains Sellers results hash" do
      expect(@json["sellers_results"]).to be_an(Hash)
    end

    it "has Online sellers" do
      expect(@json["sellers_results"]["online_sellers"]).to_not be_empty
    end

    describe "have first Online sellers result" do

      before :all do
        @first_result = @json["sellers_results"]["online_sellers"][0]
      end

      it "is first" do
        expect(@first_result["position"]).to be(1)
      end

      it "has name" do
        expect(@first_result["name"]).to_not be_empty
      end

      it "link starts with https://www.google.com" do
        expect(@first_result["link"]).to start_with("https://www.google.com")
      end
      
      it "rating is percentage or null" do
        expect(@first_result["rating"]).to match(/(([1-9][0-9]?|100)%)/).or be_nil
      end
      
      it "has :additional_price" do
        expect(@first_result["additional_price"]).to_not be_empty
      end
      
      it "has :base_price" do
        expect(@first_result["base_price"]).to_not be_empty
      end

      it "has :total_price" do
        expect(@first_result["total_price"]).to_not be_empty
      end

    end

  end

end