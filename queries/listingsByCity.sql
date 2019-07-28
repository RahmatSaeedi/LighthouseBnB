SELECT properties.*, avg(property_reviews.rating) AS average_rating   
FROM properties
LEFT OUTER JOIN property_reviews ON property_id = properties.id
WHERE city like '%ancouver%' 
GROUP BY properties.id
HAVING avg(property_reviews.rating) >= 4
ORDER BY cost_per_night ASC
LIMIT 10;