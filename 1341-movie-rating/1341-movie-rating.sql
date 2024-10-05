(SELECT sub1.name as results
FROM (
    SELECT mr.user_id, u.name, COUNT(mr.rating) AS rating_count
    FROM MovieRating mr
    INNER JOIN Users u 
    ON mr.user_id = u.user_id
    GROUP BY mr.user_id
    ORDER BY rating_count DESC, u.name ASC
    LIMIT 1
    ) sub1)

UNION ALL

(SELECT sub2.title
FROM (
    SELECT mr.movie_id, m.title, AVG(rating) AS avg_rating
    FROM MovieRating mr
    INNER JOIN Movies m
    ON mr.movie_id = m.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY movie_id
    ORDER BY avg_rating DESC, m.title ASC
    LIMIT 1
    ) sub2)