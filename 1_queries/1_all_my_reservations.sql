SELECT reservations.*, properties.*, AVG(rating)as average_rating
FROM property_reviews
JOIN reservations ON reservation_id = reservations.id
JOIN properties ON reservations.property_id = properties.id
WHERE reservations.guest_id = 1
AND end_date < now()::date
GROUP BY reservations.id, properties.id
ORDER BY start_date
LIMIT 10;