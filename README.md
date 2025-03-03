P1 - Entities, Attributes & Table Structures
🔹 Identified Entities and Attributes
1️⃣ Theatre (Details of different theatres)

theatre_id (Primary Key)
name (Theatre name)
location
2️⃣ Movie (Details of movies being screened)

movie_id (Primary Key)
title
duration (in minutes)
language
genre
3️⃣ Show (Represents a movie show at a theatre)

show_id (Primary Key)
theatre_id (Foreign Key → Theatre)
movie_id (Foreign Key → Movie)
show_date
show_time
4️⃣ Seats (Details of available seats per show)

seat_id (Primary Key)
show_id (Foreign Key → Show)
seat_number
is_booked (Boolean)

 ER Diagram Explanation
1️⃣ Theatre 🏢 → Contains theatre_id, name, and location.
2️⃣ Movie 🎬 → Contains movie_id, title, duration, language, genre.
3️⃣ Show 🕒 → Connects a Movie to a Theatre with show_id, show_date, show_time.
4️⃣ Seats 🎟 → Stores seat_id, seat_number, is_booked, linked to show_id.
5️⃣ Relationships:

A Theatre has many Shows.
A Movie has many Shows.
A Show has many Seats.

Summary
P1: Database schema (entities, attributes, and tables).
P2: SQL query to fetch all shows on a given date in a given theatre.
This design follows BCNF normalization and ensures data consistency.
