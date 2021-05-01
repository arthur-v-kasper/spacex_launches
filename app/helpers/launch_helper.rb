module LaunchHelper
    def formatter_simple_date(date)
        Date.parse(date).strftime('%a %d %b %Y') 
    end
    
end
