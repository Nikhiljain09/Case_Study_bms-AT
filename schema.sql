-- 1. Theatre Table
CREATE TABLE Theatre (
    theatre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- 2. Movie Table
CREATE TABLE Movie (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    language VARCHAR(50),
    genre VARCHAR(100)
);

-- 3. Show Table
CREATE TABLE Show (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    theatre_id INT,
    movie_id INT,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE CASCADE
);

-- 4. Seats Table
CREATE TABLE Seats (
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    show_id INT,
    seat_number VARCHAR(10) NOT NULL,
    is_booked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (show_id) REFERENCES Show(show_id) ON DELETE CASCADE
);


-- Insert into Theatre
INSERT INTO Theatre (name, location) VALUES
('PVR Cinemas', 'Mumbai'),
('INOX', 'Bangalore');

-- Insert into Movie
INSERT INTO Movie (title, duration, language, genre) VALUES
('Inception', 148, 'English', 'Sci-Fi'),
('Interstellar', 169, 'English', 'Sci-Fi');

-- Insert into Show
INSERT INTO Show (theatre_id, movie_id, show_date, show_time) VALUES
(1, 1, '2025-03-05', '18:00:00'),
(1, 2, '2025-03-05', '21:00:00'),
(2, 1, '2025-03-05', '20:00:00');

-- Insert into Seats
INSERT INTO Seats (show_id, seat_number, is_booked) VALUES
(1, 'A1', FALSE),
(1, 'A2', TRUE),
(2, 'B1', FALSE);

-- P2 -- Query to list all shows for a given date at a given theatre
SELECT 
    s.show_id,
    m.title AS movie_title,
    s.show_date,
    s.show_time
FROM 
    Show s
JOIN 
    Movie m ON s.movie_id = m.movie_id
WHERE 
    s.theatre_id = 1 AND s.show_date = '2025-03-05';