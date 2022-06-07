USE codeup_test_db;

SELECT 'Album:' AS 'The name of all albums by Pink Floyd:', name FROM albums WHERE artist = 'Pink Floyd';

SELECT 'Year:' AS 'The year Sgt. Pepper''s Lonely Hearts Club Band was released:', release_date FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT 'Genre:' AS 'The genre for Nevermind:', genre FROM albums WHERE name = 'Nevermind';

SELECT 'Album:' AS 'Albums released in the 1990s:', name FROM albums WHERE release_date BETWEEN 1990 AND 1999;

SELECT 'Album:' AS 'Albums with less than 20 million certified sales:', name FROM albums WHERE sales < 20.0;

SELECT 'Album:' AS 'All albums with a genre of ''Rock'':', name FROM albums WHERE genre = 'Rock';