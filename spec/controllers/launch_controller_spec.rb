require 'rails_helper'
require 'webmock/rspec'
include WebMock::API

RSpec.describe LaunchController, type: :controller do
            
       describe "Run all routes" do
              it "Next launch" do
                  WebMock.stub_request(:get, 'https://api.spacexdata.com/v4/launches/next').to_return(body: "abc", status: 200)
                  get :next                           
                  expect(response).to have_http_status(:ok)
                  expect(@controller.view_assigns['next']).to eq('abc')                    
              end
              it "Latest launch" do
                  WebMock.stub_request(:get, 'https://api.spacexdata.com/v4/launches/latest').to_return(body: "abc", status: 200)
                  get :latest                           
                  expect(response).to have_http_status(:ok)
                  expect(@controller.view_assigns['latest']).to eq('abc')                    
              end
              it "Upcoming launch" do
                  WebMock.stub_request(:post, 'https://api.spacexdata.com/v4/launches/query').to_return(body: "abc", status: 200)
                  get :upcoming                           
                  expect(response).to have_http_status(:ok)
                  expect(@controller.view_assigns['upcoming']).to eq('abc')                    
              end
              it "Past launch" do
                  WebMock.stub_request(:post, 'https://api.spacexdata.com/v4/launches/query').to_return(body: "abc", status: 200)
                  get :past                           
                  expect(response).to have_http_status(:ok)
                  expect(@controller.view_assigns['past']).to eq('abc')                    
              end
        end
end