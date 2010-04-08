# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Following helper stunts the length of the solution in the case that it is longer than the description. 
  def smart_solution_printer(my_description, my_solution)
    if my_solution.size > my_description.size
      my_solution[0..my_description.size] + " ..."
    else
      my_solution
    end
  end
  
  #The following helper stunts to length of the SHA to the first 6 characters
  def smart_sha_printer(my_sha)
    if my_sha != "" 
       my_sha = my_sha[0..5] + "..."
    end
    my_sha
  end
  
  
  #The following helper prints date in a more readable format. 
  def smart_date_printer(my_date)
    if my_date > 7.days.ago 
      my_date.strftime("%A, %H:%M ")
    else
      my_date.to_s(:long)
    end
  end
  
  
  #Following helper is used to generate links to a particular project 
  def print_github_project_link(my_project_title)
    "http://github.com/desiringgod/" + my_project_title
  end


  #The Following helper is used to generate links to specific commits. It uses the above helper. 
  def print_github_commit_link(this_project_title, my_sha)
      print_github_project_link this_project_title + "/commit/" + my_sha
  end
  
  
  #The following helper has the logic that determies the order in which the entries will be ordered when one of the table headers is clicked
  def get_direction(curr_order, prev_order, dir)
    if !dir #If at all direction was nil
     " ASC"
    end

    if (prev_order && prev_order == curr_order) #In the case that the user has clicked the column header again, the order toggles. 
      if dir == ' DESC'
        ' ASC'
      else
        ' DESC'
      end
    else #In the case that the user now has clicked a different column header. 
      ' ASC'
    end

  end



end
