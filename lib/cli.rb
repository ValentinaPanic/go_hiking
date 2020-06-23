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
        # puts "\nHere is the list of trails:\n\n"
       loop do
        menu
        input = trail_choice
        case input
        when "exit"
            break
        when "invalid"
            next
        else
            puts hike_details(input.to_i)
        end
    end
       
    end
    def hike_details(inp)
        hike_obj = GoHiking::Hike.all[inp]
        GoHiking::ApiManager.get_hike_details(hike_obj)
      
        puts  hike_obj.full_details
        puts "Press any key to continue your search..."
        gets
        
    end
    def menu
        display_trails
        display_instructions
        
    end
    def display_trails
     trails = GoHiking::Hike.all
     trails.each.with_index(1) do |trail,index|
        puts "#{index}. #{trail.name}"
     end
    
    end
    def trail_choice
        input = gets.strip
        return input if input == "exit"
        if input.to_i.between?(1, GoHiking::Hike.all.length)
            return input
            # binding.pry
        else
            puts "Your input doesn't match our data!"
            return "invalid"
        end
    end
    def display_instructions
        puts <<-INST
Choose a trail by number or type "exit" to exit the program!
        INST
    end

end