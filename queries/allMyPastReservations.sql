SELECT 
  properties.*,
  reservations.*,
  avg(property_reviews.rating) AS average_rating
FROM reservations
LEFT JOIN properties ON properties.id = reservations.property_id
LEFT JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1 AND end_date < now()::date
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
LIMIT 10;