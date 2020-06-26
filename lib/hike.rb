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
    def full_details
        <<-DESC
     Name: #{self.name}
     Location: #{self.location}
     Difficulty: #{self.difficulty}
     Trail Length: #{self.hike_length}
     Summary: #{self.summary}
     You can see more information on the following URL: #{self.url}
        
        DESC
    end

end