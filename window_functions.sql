use window_posts;

SELECT post_id, user_id, likes,
       DENSE_RANK() OVER (PARTITION BY user_id ORDER BY likes DESC) AS rn
FROM posts
ORDER BY post_id;

SELECT post_id, user_id, likes,
       ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY likes DESC) AS rn
FROM posts;

SELECT *
FROM (
    SELECT post_id, user_id, likes,
           DENSE_RANK() OVER (PARTITION BY user_id ORDER BY likes DESC) AS rn
    FROM posts
) ranked
WHERE rn = 2 AND user_id = 4;

SELECT post_id, user_id, likes,
       RANK() OVER (PARTITION BY user_id ORDER BY likes DESC) AS rnk,
       DENSE_RANK() OVER (PARTITION BY user_id ORDER BY likes DESC) AS drnk
FROM posts;

SELECT user_id, likes,
       SUM(likes) OVER (PARTITION BY user_id) AS total_likes
FROM posts;

