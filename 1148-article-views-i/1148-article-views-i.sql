SELECT DISTINCT viewer_id AS id 
FROM Views
WHERE viewer_id = author_id
ORDER BY id;