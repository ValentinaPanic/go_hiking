class GoHiking::CLI

    def start
        introduction
        get_hike_info
        main_loop
    end
    def introduction
        puts "\nWelcome to Go Hiking App!\n\n"
    end
    def get_hike_info
        GoHiking::ApiManager.hike_info
    end

    def main_loop
        
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
        hike_obj = GoHiking::Hike.all[inp-1]
        GoHiking::ApiManager.get_hike_details(hike_obj)
      
        puts  hike_obj.full_details
        puts "\n\nPress any key to continue your search...\n"
        gets
        
    end
    def menu
        display_trails
        display_instructions
        
    end
    def display_trails
       
     trails = GoHiking::Hike.all
     trails.each_with_index do |trail,index|
        puts "#{index + 1}. #{trail.name}"
     end
    
    end
    def trail_choice
        input = gets.strip
        return input if input == "exit"
        if input.to_i.between?(0, GoHiking::Hike.all.length)
            return input
           
        else
            puts "\n\nYour input doesn't match our data!\n\n"
            return "invalid"
        end
    end
    def display_instructions
        puts <<-INST

Choose a trail by number or type "exit" to exit the program!

        INST
    end

end