# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
#

  require 'faker'
  
  @user_names = ['Stu', 'Ben', 'Gags', 'Mike', 'Tyler', 'Eric', 'John', 'Jim', 'Sarah', 'Roy']
  @user_emails = ['Stu@desiringgod.org', 'ben@desiringgod.org', 'gags@gmail.com', 'mike@yahoo.com', 'tyler@hopeingod.org', 'eric@google.com', 'johnpareirra@e-conceive.com', 'jim_anderson@hope.com', 'sarah@laywersarecool.com', 'switchblade@gmail.com']
  @github_titles = ['dgweb', 'LogBook', 'dgnet', 'dgresources']
  @logbook_shas = [
    '979cdac78422fc6d82f979eeaf955dcc43a23895',
    '556f28d3d1370a11094225d7d7e3a823ea925916',
    'ff863a9351607fd3a8f15fbff59aafbe2a9dbad1',
    '00d3e7f1b3285aa939724710519b92e5cd4fdc7f',
    '83cfbf2c785668ee74f5eeac511391cc29726b53',
    '5bc65a9d213551de2219d179881ab5e8f32b7e8e',
    'dba4e0a47203c890b9a89ea4de9eea8652376503',
    'd8eeefb572b58935b314176645e8b97b9c703b74',
    '9cd6bf8cb890de0f07b711080dbb8ae82db8789d',
    '1d0f9b7a58642089b257e16d2cb93a0a7500fb60',
    'e3080af59ecc828468d8ba217c96750cfc14d49a',
    '5ba9b94a4e8af46bc0eafc13772623aa9d289f7b',
    '6a21bcf8431d411ca3142308e9c01243d6c8814d',
    '86eadacd978d23c7f9b69e00bd3848fd22f7071a',
    '0972743a4f77b87b42f8ee19fbfb3d13bf043494'
  ]
  @sha_char_array =  ('A' .. 'Z').to_a + ('a' .. 'z').to_a + ('0' .. '9').to_a
  @tags = ['tag1', 'tag2', 'tag3', 'tag4', 'tag5', 'tag6', 'tag7', 'tag8', 'tag9', 'tag10', 'tag11', 'tag12', 'tag13', 'tag14', 'tag15' ]
  
  def random_date(params={})
    years_back = params[:year_range] || 5
    latest_year  = params[:year_latest] || 0
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

  def sha_generator(proj_id)
    if proj_id == 2 #ie if the project is log book
      @logbook_shas[rand(15)] #get a valid sha
    else
      random_sha_generator #else generate random sha
    end
  end

  10.times do |i|
    u = User.create(
    :name => @user_names[i],
    :email => @user_emails[i],
    :created_at =>random_date(:year_range =>1, :year_latest => 5), #creates an illusion that this was created 6 years back. ie before the log_book_entries table was created
    :updated_at => random_date(:year_range =>1, :year_latest => 5) #not been careful to have updated at later than or equal to created at.
    )
  end

  4.times do |i|
    p = GithubProject.create(
      :title => @github_titles[i],
      :github_name => Faker::Lorem.words(1), # for some werid reason faker gives each word as '--- -' followed by a valid faker name. i just deleted the --- - manually. 
      :created_at => random_date(:year_range =>1, :year_latest => 5), #creates an illusion that this was created 6 years back. ie before the log_book_entries table was created
      :updated_at => random_date(:year_range =>1, :year_latest => 5) #not been careful to have updated at later than or equal to created at.
    )
  end

  1000.times do
    project_id = rand(4) + 1
    l = LogBookEntry.create(
      :title => Faker::Lorem.sentence(20),
      :description => Faker::Lorem.paragraph(10),
      :solution => Faker::Lorem.paragraph(15),
      :user_id => rand(10) + 1,# same as (rand * 4) ceil, ie range 1 to  4
      :github_project_id => project_id,
      :sha_of_problem => sha_generator(project_id), #cannot pass :github_project_id to the function 
      :sha_of_solution => sha_generator(project_id),
      :created_at => random_date, #generates random date between today and 5 years ago
      :updated_at => random_date
    )
  
    rand(4).times do #gives the possibility of 0 tags
      l.tag_list.add(@tags[rand(15)])
      l.save
    end
  end

