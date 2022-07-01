# Advanced SQL - Mandatory Project
# Queries

# Q1) Write a SQL query to find those reviewers who have rated nothing for some movies. Return reviewer name.
select rev_name,rev_stars from moviedb.reviewer 
natural join rating
where rev_stars = 0;

# Q2) Write a SQL query to find the movies, which have been reviewed by any reviewer body except by 'Paul Monks'. Return movie title.
select rev_name,mov_title from moviedb.reviewer
natural join rating
natural join movie
where rev_name not like 'Paul Monks';

# Q3) write a SQL query to find the lowest rated movies. Return reviewer name, movie title, and number of stars for those movies.
select rev_name,mov_title,rev_stars from moviedb.reviewer
natural join rating
natural join movie
where rev_stars = 0;


# Q4) write a SQL query to find the movies directed by 'James Cameron'. Return movie title.
select dir_fname,dir_lname,mov_title from director
natural join movie_direction
natural join movie
where dir_fname = 'James' and dir_lname = 'Cameron';

# Q5) Write a query in SQL to find the name of those movies where one or more actors acted in two or more movies.


# Finding the name of the movies on which Two or More actors were acted

select mov_title,count(act_fname) from actors
natural join movie_cast
natural join movie
group by mov_title 
having count(act_fname) = 2;

# Finding the names  of actors who acted in  Two or More movies

select act_fname,act_lname,count(mov_title) from actors
natural join movie_cast
natural join movie
group by act_fname
having count(mov_title) = 2;

# Explanation :
-- By above two result sets we can say that there are no movies on which Two or more actors were acted 
-- where as here we have only one actor who acted in Two or more movies his name is " Kevin Spacey"
