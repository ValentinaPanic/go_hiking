class GoHiking::CLI

    def start
        introduction
        get_hike_info
        main_loop
    end
    def introduction
        puts "\nWelcome to Go Hiking App!\n"
    end
    def get_hike_info
        GoHiking::ApiManager.hike_info
    end

    def main_loop
        puts "\nHere is the list of trails:\n\n"
        menu
       
    end
    def menu
        display_trails
        binding.pry
    end
    def display_trails
     trails = GoHiking::Hike.all
     trails.each.with_index(1) do |trail,index|
        puts "#{index}. #{trail.name}"
     end
    
    end

end