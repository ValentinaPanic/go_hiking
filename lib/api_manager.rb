class GoHiking::ApiManager
    URL = "https://www.hikingproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=10&key=200803333-f1120c27d3233ddade5e281a0a009e3e"

    def self.hike_info
        url = URI.parse(URL)
        response = HTTParty.get(url)
        trails_hashes = response["trails"]
    end

end