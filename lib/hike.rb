class GoHiking::Hike
    attr_accessor :name, :location, :summary, :difficulty, :url, :hike_length
    @@all = []

    def self.create_from_api(hikes_array)
        hikes_array.collect do |hike_hash|
             self.new(hike_hash["name"])
                   
        end
    end

    def self.all
        @@all
    end
    def initialize(name)
        @name= name
        save

    end
    def save
        @@all << self
    end

end