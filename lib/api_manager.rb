class GoHiking::ApiManager
    URL = "https://www.hikingproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=25&key=200803333-f1120c27d3233ddade5e281a0a009e3e"

    def self.hike_info
        url = URI.parse(URL)
        response = HTTParty.get(url)
        hikes_array = response["trails"]
        GoHiking::Hike.create_from_api(hikes_array)
        # binding.pry
    end

end