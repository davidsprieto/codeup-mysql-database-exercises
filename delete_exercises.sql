USE codeup_test_db;

SELECT 'Album:' AS 'Albums released before 1991:', name, artist FROM albums WHERE release_date > 1991;

SELECT 'Album:' AS 'Albums with the genre ''Disco'':', name, artist FROM albums WHERE genre = 'disco';

SELECT 'Album:' AS 'Albums by Nirvana:', name, artist FROM albums WHERE artist = 'Whitney Houston';

DELETE FROM albums WHERE release_date > 1991;
SELECT * FROM albums;

DELETE FROM albums WHERE genre = 'Disco';
SELECT * FROM albums;

DELETE FROM albums WHERE artist = 'Whitney Houston';
SELECT * FROM albums;