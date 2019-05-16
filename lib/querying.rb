def select_books_titles_and_years_in_first_series_order_by_year
  "
    select books.title, books.year
    from books
    inner join series
    on books.series_id = series.id 
    where series.id = 1
    order by books.year asc ;
  "
end

def select_name_and_motto_of_char_with_longest_motto
  "Select name, motto from characters ORDER BY LENGTH(motto) DESC limit 1;"
end


def select_value_and_count_of_most_prolific_species
  "select species, max(total) from (select species, count(*) as total from characters group by species);"
end

def select_name_and_series_subgenres_of_authors
  "select authors.name, subgenres.name 
  from authors
  Join series on series.author_id = authors.id 
  join subgenres on subgenres.id = series.subgenre_id;"
end

def select_series_title_with_most_human_characters
  "select title from (select title, max(total) from (select title, count(characters.author_id) total from series left join characters on characters.author_id = series.author_id group by title));"
end

def select_character_names_and_number_of_books_they_are_in
  "select name, count(books.id) as total 
  from characters 
  left join character_books on character_id = characters.id 
  left join books on books.id = book_id group by name order by total desc;"
end
