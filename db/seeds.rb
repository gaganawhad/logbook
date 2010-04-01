# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
#

 require 'faker'

  @user_ids = [3,4,5,6,7,8]
  @github_project_ids = [1,2,3,4]
  @sha_char_array =  ('A' .. 'Z').to_a + ('a' .. 'z').to_a + ('0' .. '9').to_a

  def random_date(params={})
    years_back = params[:year_range] || 5
    latest_year  = params [:year_latest] || 0
    year = (rand * (years_back)).ceil + (Time.now.year - latest_year - years_back)
    month = (rand * 12).ceil
    day = (rand * 31).ceil #this function generates random numbers starting from 1 till 31
    hour = rand(24) # rand function generates random numbers between 0 and 23 including the two numbers 
    minute = rand(60)
    second = rand(60)
    Time.local(year, month, day, hour, minute, second)
  end



  def random_sha_generator
    my_sha = ""
    40.times do my_sha << @sha_char_array[rand(62)] end
    my_sha
  end

  1000.times do
    l = LogBookEntry.create(
      :title => Faker::Lorem.sentence(20),
      :description => Faker::Lorem.paragraph(10),
      :solution => Faker::Lorem.paragraph(15),
      :user_id => @user_ids[rand(6)],
      :sha_of_problem => random_sha_generator,
      :sha_of_solution => random_sha_generator,
      :github_project_id => @github_project_ids[rand(4)],
      :created_at => random_date,
      :updated_at => random_date
    )

  end

