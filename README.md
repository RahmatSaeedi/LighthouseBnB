# ERD
## Diagram
![ERD](docs/erd.png)
## ERD Info
- _`users`_
  - `id`: Primary Key
  - `name`
  - `email`
  - `password`
  
- _`property_types`_
  - `id`: Primary Key
  - `type`

- _`properties`_
  - `id`: Primary Key
  - `title`
  - `description`
  - `thumbnail_photo_url`
  - `cover_photo_url`  
  - `owner_id` : Foreign Key _`users(id)`_
  - `cost_per_night`
  - `country`
  - `street`
  - `city`
  - `province`
  - `postal_code`
  - `parking_spaces`
  - `number_of_bedrooms`
  - `number_of_washrooms`
  - `property_type` : Optional, defaults to `1`, in future may reference to _`property_types(id)`_
  - `active`

- _`reservations`_
  - `id`: Primary Key
  - `start_date`
  - `end_date`
  - `property_id` : Foreign Key _`properties(id)`_
  - `guset_id` : Foreign Key _`users_id(id)`_

- _`property_reviews`_
  - `id`: Primary Key
  - `guest_id` : Foreign Key _`users(id)`_
  - `owner_id` : Foreign Key _`users(id)`_
  - `reservation_id` : Foreign Key _`reservations(id)`_
  - `message`
  - `rating`


# Migrations
## [schema.sql](migrations/schema.sql)
Creates database `lightbnb` and switches to it.

# Queries
## [getUserByEmail.sql](queries/getUserByEmail.sql)
Selects _id, name, email & password_ of a given user; here 'tristanjacobs@gmail.com'.
```bash
 id |     name      |          email          |   password
----+---------------+-------------------------+--------------
  1 | Devin Sanders | tristanjacobs@gmail.com |  $2a$10$FB...
(1 row)
```

averageLengthOfReservations
## [averageLengthOfReservations.sql](queries/averageLengthOfReservations.sql)
the average duration of all reservations.
```bash
  average_duration   
---------------------
 14.6636000000000000
(1 row)
```