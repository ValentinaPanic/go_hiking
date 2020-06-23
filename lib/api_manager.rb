class GoHiking::ApiManager
    URL = "https://www.hikingproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=25&key=200803333-f1120c27d3233ddade5e281a0a009e3e"

    def self.hike_info
        url = URI.parse(URL)
        response = HTTParty.get(url)
        hikes_array = response["trails"]
        GoHiking::Hike.create_from_api(hikes_array)
        
       
    end
    def self.get_hike_details(hike_obj)
        url = URI.parse(URL)
        response = HTTParty.get(url)
        res = response["trails"]
        res.each do |h|
        hike_obj.location = h["location"]
        hike_obj.summary = h["summary"]
        hike_obj.difficulty = h["difficulty"]
        hike_obj.url = h["url"]
        hike_obj.hike_length = h["length"]
        # binding.pry
        end

    end

end