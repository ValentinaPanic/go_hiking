class GoHiking::CLI

    def start
        introduction
        get_hike_info
        main_menu
    end
    def introduction
        puts "\nWelcome to Go Hiking App!\n"
    end
    def get_hike_info
        GoHiking::ApiManager.hike_info
    end

    def main_menu
        puts "\nIn the main menu!\n"
        binding.pry
    end

end