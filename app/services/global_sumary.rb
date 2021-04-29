class GlobalSumary
    include HTTParty
    base_uri 'https://api.spacexdata.com/v4'

    def initialize
      @options = getParams
    end

    def past
        self.class.get("/past",@options)
    end

    def next
        self.class.get("/launches/next")
    end

    def upcoming
       self.class.post("/launches/query",body: @options).parsed_response
    end

    def latest
        self.class.get("/launches/latest")
    end

    #private
    def getParams #(handler)
         {'query':{'upcoming': 'true'},'options':{'select':['name','flight_number','date_utc'],'limit': '5','sort':{'flight_number': 'asc' }}} #upcoming
         #{'query':{'upcoming': 'false'},'options':{'select':['name','flight_number','date_utc'],'limit': '5','sort':{'flight_number': 'desc' }}} #past         
    end
end