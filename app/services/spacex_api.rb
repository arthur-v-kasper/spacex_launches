class SpacexApi
    include HTTParty
    base_uri 'https://api.spacexdata.com/v4/launches'

    def initialize
      @options = getParams
    end

    def past
        self.class.post("/query",body: @options[:past]).parsed_response
    end

    def next
        self.class.get("/next").parsed_response
    end

    def upcoming
       self.class.post("/query",body: @options[:upcoming]).parsed_response
    end

    def latest
        self.class.get("/latest").parsed_response
    end

    def getParams
                    # identar esses hash
        params = {upcoming:
                    {'query':
                        {'upcoming': 'true'},
                            'options':
                                {'select':
                                    ['name','flight_number','date_local'],
                                    'limit': '5',
                                    'sort':{'flight_number': 'asc' }
                                }
                     },
                  past:{'query':
                        {'upcoming': 'false'},
                            'options':
                                {'select':['name','flight_number','date_local'],
                                    'limit': '5',
                                    'sort':{'flight_number': 'desc' }
                                }
                        }
                }        
    end
end