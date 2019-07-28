# ERD
## Diagram
![ERD](docs/erd.png)
## ERD Info
- _`users`_
  - `id`: Primary Key
  - `name`
  - `email`
  - `password`

- _`properties`_
  - `id`: Primary Key
  - `title`
  - `description`
  - `thumbnail_photo_url`
  - `cover_photo_url`  
  - `owner_id` : Foreign Key _`users(id)`_
  - `cost_per_night`
  - `street`
  - `city`
  - `province`
  - `postal_code`
  - `parking_spaces`
  - `number_of_bedrooms`
  - `number_of_washrooms`
  - `property_type` : Foreign Key _`property_types(id)`_
  - `active`
- _`property_types`_
  - `id`: Primary Key
  - `type`

- _`reservations`_
  - `id`: Primary Key
  - `start_date`
  - `end_date`
  - `property_id` : Foreign Key _`properties(id)`_
  - `guset_id` : Foreign Key _`users_id(id)`_

- _`guest_reviews`_
  - `id`: Primary Key
  - `guest_id` : Foreign Key _`users(id)`_
  - `owner_id` : Foreign Key _`users(id)`_
  - `reservation_id` : Foreign Key _`reservations(id)`_
  - `message`
  - `rating`
# Migrations
## [schema.sql](migrations/schema.sql)
Creates `lightbnb` and switches to it.


