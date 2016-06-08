namespace :demotask do


  desc "display the current environment of rake"
  task :current_environment do
    puts "Current Time : " + Time.new.inspect
    puts "You are running rake task in #{Rails.env} environment"

  end

  desc "You are going to meet a person"
  task :meet_a_person do
    puts "I meet a person on the way to my house"
  end

  desc "I will say hello to the person"
  task :say_hello => :meet_a_person do # It means meet_a_person is dependency of say_hello task
    puts "I said HELLO to the person"
  end

  desc "I will say hello to the person after meeting and check environment"
  task :hello_env => [:current_environment, :meet_a_person] do # multiple dependency can be 
                                                               #passed as array
    puts "I said HELLO to the person"
  end

  desc "going to call two of my friend"
  task :call_friend, [:friend1, :friend2] do |t, args| # task with two arguments
    args.with_defaults(:friend1 => "John", :friend2 => "Dough")
    puts t # print t to see what it contain
    puts args # print args to see what it contain and in which format
    puts "Hello #{args.friend1}"
    puts "Hello  #{args.friend2}"
  end

  desc "see what happen when you call a modal method without loading environment"
  task :without_environment do
    puts User.first.name
  end

  desc "load environment before operating on any model object"
  task :with_environment => :environment do
    puts User.first.name
  end

  desc "count number of records in given model table"
  task :count_records, [:model] => :environment do |t, args| # task with both arguments and dependency
    args.with_defaults(:model => "User" )
    model_calss_name = Object.const_get(args.model) # this is very important as when you#pass argument it come as a string, so you must convert it to model class
    puts "No of records is #{model_calss_name.count}"
  end

end