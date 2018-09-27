def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year FROM books
  WHERE series_id = (SELECT MIN(series_id) FROM books)
  ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters
  WHERE length(motto) = (SELECT max(length(motto)) FROM characters)"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) c FROM characters
  GROUP BY species
  ORDER BY c DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM series
  JOIN authors ON authors.id = series.author_id
  JOIN subgenres ON subgenres.id = series.subgenre_id "
end

def select_series_title_with_most_human_characters
  "SELECT title FROM characters
  JOIN series ON series.id = characters.series_id
  GROUP BY title
  HAVING species = 'human'
  ORDER BY count(species) DESC LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT name, COUNT(book_id) count FROM characters c
  JOIN character_books cb ON c.id = cb.character_id
  GROUP BY name
  ORDER BY count DESC"
end
