# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def smart_sha_printer(my_sha)
    if my_sha != "" 
       my_sha = my_sha[0..5] + "..."
    end
    my_sha
  end
  
  def smart_date_printer(my_date)
    if my_date > 7.days.ago 
      my_date.strftime("%A, %H:%M ")
    else
      my_date.to_s(:long)
    end
  end
  
  def print_github_project_link(my_project_title)
    "http://github.com/desiringgod/" + my_project_title
  end
 
  def print_github_commit_link(this_project_title, my_sha)
      print_github_project_link this_project_title + "/commit/" + my_sha
  end
  
  def get_direction(curr_order, prev_order, dir)
    if !dir
     " ASC"
    end

    if (prev_order && prev_order == curr_order)
      if dir == ' DESC'
        ' ASC'
      else
       return ' DESC'
      end
    else
      return ' ASC'
    end
  end

end
