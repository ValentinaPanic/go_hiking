class GoHiking::Hike
    attr_accessor :name, :location, :summary, :difficulty, :url, :hike_length
    @@all = []

    def self.create_from_api(hikes_array)
        hikes_array.collect do |hike_hash|
             self.new(hike_hash["name"],hike_hash["location"],hike_hash["summary"],
             hike_hash["difficulty"],hike_hash["url"],hike_hash["length"])
        
                       
        end
    end

    def self.all
        @@all
    end
    def initialize(name,location,summary,difficulty,url,hike_length)
        @name= name
        @location = location
        @summary = summary
        @difficulty = difficulty
        @url = url
        @hike_length = hike_length
        save

    end
    def save
        @@all << self
    end

end