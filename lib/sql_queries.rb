# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT Projects.title,SUM(amount) FROM Projects INNER JOIN Pledges ON Projects.id = Pledges.project_id GROUP BY Projects.title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT Users.name, Users.age,SUM(amount) FROM Users INNER JOIN Pledges ON Users.id = Pledges.user_id GROUP BY Users.name ORDER BY Users.name ASC"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT Projects.title,(SUM(amount) - Projects.funding_goal) AS remainder FROM Projects JOIN Pledges ON Pledges.project_id = Projects.id  GROUP BY Projects.title HAVING remainder >= 0"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT Users.name, SUM(Pledges.amount) FROM Users JOIN Pledges ON Users.id = pledges.user_id GROUP BY users.name ORDER BY SUM(Pledges.amount);"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT Projects.category, Pledges.amount from projects JOIN Pledges ON projects.id = pledges.project_id WHERE category = 'music' "
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT projects.category,SUM(pledges.amount) from projects JOIN pledges ON projects.id = pledges.project_id WHERE projects.category = 'books'"
end
