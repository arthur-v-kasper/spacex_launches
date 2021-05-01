require 'rails_helper'
require 'webmock/rspec'
#include WebMock::API

WebMock.stub_request(:get, 'https://api.spacexdata.com/v4/launches/next').to_return(body: "abc", status: 200)

RSpec.describe LaunchController, type: :controller do
            
         describe "Run all routes" do
                it "Next launch" do
                    get :next                           
                    expect(response).to be_successful
                    expect(response.body).to eq('abc')                    
                end
            end

  
    #   describe "GET index" do

    #         it "execute all methods response" do
    #             get :index
    #             expect(response).to be_successful
    #         end
    #     end
        
    #     describe "Run all routes " do
    #         it "Next launch" do
    #             get :next                
    #             expect(response).to be_successful
    #             expect(response.body).to eq('abc')
                
    #         end

    #         it "Latest launch" do
    #             get :latest                
    #             expect(response).to be_successful
    #         end

    #         it "Upcoming launches" do
    #             post :upcoming                
    #             expect(response).to be_successful
    #         end

    #         it "Past launches" do
    #             post :past                
    #             expect(response).to be_successful
    #         end
    #     end          
end