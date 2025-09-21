create database movie_database;

Use movie_database;
select * from actor;
select * from cast;
select * from director;
select * from genres;
select * from  movie;
select * from  movie_direction;
select * from  movie_genres;
select * from  ratings;
select * from  reviewer;


# i.Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.

select  mov_title as Cinemas , mov_dt_rel as relase_date  from movie where mov_title = 'American Beauty';

# ii.	Write a SQL query to find those movies, which were released before 1998. Return movie title.

select mov_title as Cinemas ,mov_year as relase_date  from movie where  mov_year < 1998;

# iii.	Write a query where it should contain all the data of the movies 
# which were released after 1995 and their movie duration was greater than 120.

select * from movie where mov_year < 1995 and mov_time > 120;

# iv.	Write a query to determine the Top 7 movies which were released in United Kingdom. 
# Sort the data in ascending order of the movie year.

select mov_title, mov_year , mov_rel_country as country from movie where mov_rel_country = 'UK' order by  mov_year asc limit 7;

# v.	Set the language of movie language as 'Chinese' for the movie 
# which has its existing language as Japanese and the movie year was 2001.

update movie set mov_lang = 'Chinese' where mov_title = 'japanese' and mov_year = 2001;

# vi.	Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'.

select r.rev_name,m.mov_title from reviewer r inner join ratings using(rev_id) inner join movie m using(mov_id) where mov_title ='slumdog Millionaire';

# vii.	Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors.

select a.act_fname as First_name , a.act_lname as Last_name , act_gender as Gender from actor as a inner join cast as c using (act_id)
where act_gender != 'M';

# viii.	Write a SQL query to find the actors who played a role in the movie 'Annie Hall'. 
# Fetch all the fields of actor table. (Hint: Use the IN operator).

select act_id, act_fname as first_name, act_lname as Last_name , act_gender as Gender ,role , mov_title as movie_name 
from actor as a inner join cast as c  using (act_id) inner join movie as m using(mov_id) where mov_title = 'Annie Hall';

# ix.	Write a SQL query to find those movies that have been released in countries other than the United Kingdom.
#  Return movie title, movie year, movie time, and date of release, releasing country.

select mov_title as movie_title , mov_year as movie_year , mov_time as movie_time , mov_dt_rel as date_of_release,
mov_rel_country as movie_country from movie where mov_rel_country != 'UK';

# x. Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)

select g.gen_title , max(m.mov_time) as maximum_movie_duration , count(*) as no_of_movie from genres as g
inner join movie_genres  using (gen_id)
inner join movie as m using (mov_id)
group by gen_title;

# xi. Create a view which should contain the first name, last name, title of the movie & role played by particular actor.

create view movie_details as (
select a.act_fname as First_name, a.act_lname as Last_name , m.mov_title as title_of_movie , c.role as Role_plyed from actor as a
inner join cast as c using(act_id) 
inner join movie as m using (mov_id));


#  xii.	Write a SQL query to find the movies with the lowest ratings. 

select m.mov_title as Movies , r.rev_stars as Rating from movie as m 
inner join  ratings as r order by r.rev_stars asc limit 1;




