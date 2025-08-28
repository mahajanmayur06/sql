create database moviesdb;
use moviesdb;

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    duration INT,
    release_date DATE
);

INSERT INTO Movies (movie_id, movie_name, genre, duration, release_date) VALUES
(1, 'Inception', 'Sci-Fi', 148, '2010-07-16'),
(2, 'Avengers: Endgame', 'Action', 181, '2019-04-26'),
(3, 'The Dark Knight', 'Action', 152, '2008-07-18'),
(4, 'Interstellar', 'Sci-Fi', 169, '2014-11-07'),
(5, 'Joker', 'Drama', 122, '2019-10-04');

CREATE TABLE Theaters (
    theater_id INT PRIMARY KEY,
    theater_name VARCHAR(255) NOT NULL,
    location VARCHAR(255)
);

INSERT INTO Theaters (theater_id, theater_name, location) VALUES
(1, 'Movie Palace', 'New York, USA'),
(2, 'Cinema World', 'Los Angeles, USA'),
(3, 'IMAX Cinemas', 'Chicago, USA');
CREATE TABLE Screens (
    screen_id INT PRIMARY KEY,
    theater_id INT,
    screen_name VARCHAR(100),
    capacity INT,
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);
INSERT INTO Screens (screen_id, theater_id, screen_name, capacity) VALUES
(1, 1, 'Screen 1', 100),
(2, 1, 'Screen 2', 150),
(3, 2, 'Screen 1', 200),
(4, 2, 'IMAX', 300),
(5, 3, 'Screen 1', 250),
(6, 3, 'Screen 2', 180);

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20)
);

INSERT INTO Users (user_id, name, email, phone_number) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', '555-1234'),
(2, 'Bob Smith', 'bob.smith@example.com', '555-5678'),
(3, 'Charlie Brown', 'charlie.brown@example.com', '555-9101'),
(4, 'David Lee', 'david.lee@example.com', '555-1122'),
(5, 'Eva Green', 'eva.green@example.com', '555-3344');

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    movie_id INT,
    screen_id INT,
    theater_id INT,
    user_id INT,
    booking_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id),
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
INSERT INTO Bookings (booking_id, movie_id, screen_id, theater_id, user_id, booking_date) VALUES
(1, 1, 1, 1, 1, '2025-08-01'),
(2, 1, 1, 1, 1, '2025-08-01'),
(3, 1, 2, 1, 2, '2025-08-01'),
(4, 2, 3, 2, 3, '2025-08-01'),
(5, 2, 4, 2, 4, '2025-08-01'),
(6, 3, 5, 3, 5, '2025-08-01'),
(7, 3, 5, 3, 1, '2025-08-02'),
(8, 4, 6, 3, 2, '2025-08-02'),
(9, 4, 6, 3, 3, '2025-08-02'),
(10, 5, 1, 1, 4, '2025-08-03'),
(11, 5, 2, 1, 5, '2025-08-03'),
(12, 1, 2, 1, 2, '2025-08-03'),
(13, 2, 3, 2, 1, '2025-08-03'),
(14, 3, 5, 3, 4, '2025-08-04'),
(15, 3, 6, 3, 5, '2025-08-04');


SELECT 
    b.screen_id, 
    s.screen_name,
    b.movie_id, 
    m.movie_name, 
    COUNT(*) AS total_tickets_booked
FROM 
    Bookings b
JOIN 
    Screens s ON b.screen_id = s.screen_id          -- Join Screens to get screen details
JOIN 
    Movies m ON b.movie_id = m.movie_id             -- Join Movies to get movie details
WHERE 
    b.booking_date BETWEEN '2025-08-01' AND '2025-08-07'  -- Date range for booking
    AND b.movie_id = 1                             -- Movie ID for the desired movie (e.g., 'Inception')
    AND b.screen_id = 1                            -- Screen ID for the specific screen
GROUP BY 
    b.screen_id, s.screen_name, b.movie_id, m.movie_name  -- Group by screen and movie
ORDER BY 
    b.screen_id, m.movie_name;