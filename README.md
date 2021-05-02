# README

## About this application
The objective of this project is to display the launch data provided by the [SpaceX API](https://github.com/r-spacex/SpaceX-API/blob/master/docs/v4/README.md "SpaceX API"), the following information was used:
 - Last Launch
 - Next Launch
 - Pastes Launches
 - Upcoming Launches

## Prerequisite
This project was made in: 
* Ruby 2.7.1
* Rails 6.1.3.1

## Configuration
*This step is optional*: The project has an A/B test made at Google Optimize that changes the theme randomly according to the accesses, to this work it's necessary to add the following line to the host file of your operating system:

`127.0.0.1       spacex-kasper.com`

>After that, you may need to restart your computer for the change to take effect.


## How to run the test suite
To run the tests it is necessary to have [RSpec](https://github.com/rspec/rspec-rails "RSpec") installed.
Open the terminal in the project's root folder and run:

```ruby
 bundle install
 rails generate rspec:install
```

After this, just execute the command at the terminal to check the tests:

```ruby
 rspec
```

All tests are in the this file:

`/spacex_launch/spec/controllers/lauch_controller_spec.rb`

*For mocking the HTTP request was used [WebMock](https://github.com/bblimke/webmock "WebMock")*

## Implementation points

To communicate with the API was created a ```GlobalSumary``` in the folder ```app/controllers/services/```, the gem ``` HTTParty``` was used to perform the requests.

This class has four methods, where each of them is responsible for information ( ```next```, ```past```, ```upcoming```, ```latest``` ), two of these methods use the same endpoint, where it is possible to perform queries to customize the result, for this, was created the method```getParams``` that return a ```hash``` with the necessary filters and data for querying and displaying the results.

The controller ```LaunchController``` consumes data from ```SpacexApi``` so that it is then displayed in the view, it has a similar structure, with four methods, the implementation is very simple, since the bureaucratic part is in charge of the service. =)

As the application has only one page, all methods have been instantiated in the ```index```, so when the route is accessed, all data is available for display.

And finally, in the view we have four blocks to display the results, two upper blocks where unitary launches are displayed, last and next, and at the bottom a table with the last and next five launches.
A Helper was created to handle the dates (```formatter_simple_date```).
Bootstrap was used to make the look more pleasant. =) 

## Run the project
Access the project root folder from the terminal and run:
```ruby
rails s
```

If you performed the configuration step of the host file described at the beginning, after the application starts you can access it by ```http://spacex-kasper.com:3000/```.
In this situation the A/B test will be working and the application may appear to you in the original way or as DarkMode.

## Metrics from A/B test (Only from the first few days)

In three days of testing, accessing the application from a single machine, we can compile the data below:

Page view of the experiment. 
![](https://i.imgur.com/pS6Y6jH.png)

Session of experiment
![](https://i.imgur.com/qYdxW5L.png)

This table shows us very interesting data, accesses in the DarkMode variant have much longer sessions and with higher bounce rates.
![](https://i.imgur.com/nyjMvxl.png)

In this other table with some more information, Google Optimize suggested that the DarkMode variant is 100% likely to be the best combination.
![](https://i.imgur.com/AcYSjPp.png)