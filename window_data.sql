create database window_posts;

use window_posts;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Posts (
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    likes INT DEFAULT 0,
    PRIMARY KEY (user_id, post_id)
);
INSERT INTO Users (username, email) VALUES
('john_doe', 'john@example.com'),
('jane_smith', 'jane@example.com'),
('alice_jones', 'alice@example.com'),
('bob_miller', 'bob@example.com'),
('charlie_brown', 'charlie@example.com');
INSERT INTO Posts (user_id, post_id, likes) VALUES
(1, 101, 25),  -- Post by john_doe
(2, 102, 40),  -- Post by jane_smith
(1, 103, 10),  -- Post by john_doe
(3, 104, 55),  -- Post by alice_jones
(4, 105, 5),   -- Post by bob_miller
(2, 106, 30),  -- Post by jane_smith
(5, 107, 70),  -- Post by charlie_brown
(3, 108, 15),  -- Post by alice_jones
(3, 116, 15),  -- Post by alice_jones
(3, 117, 15),  -- Post by alice_jones
(3, 118, 8),  -- Post by alice_jones
(3, 119, 8),  -- Post by alice_jones
(4, 109, 8),   -- Post by bob_miller
(4, 111, 8),   -- Post by bob_miller
(4, 112, 8),   -- Post by bob_miller
(4, 113, 20),   -- Post by bob_miller
(4, 114, 20),   -- Post by bob_miller
(4, 115, 20),   -- Post by bob_miller
(5, 110, 60);  -- Post by charlie_brown
