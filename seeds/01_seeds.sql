INSERT INTO users(name, email, password)
VALUES
('Miu Miu', 'miu@miu.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
('Wall E', 'wall@e.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
('Mir D', 'mir@d.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u');

INSERT INTO properties (id, owner_id, title, description, thumbnail_photo_url , cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES (1, 2, 'Chanel', 'description', 'thumbnail_photo_url' , 'cover_photo_url', 100, 2, 3, 1, 'USA', 'street1', 'city1', 'province1', 'postcode1', true),
(2, 3, 'Dior', 'description', 'thumbnail_photo_url' , 'cover_photo_url', 150, 3, 3, 2, 'France', 'street2', 'city2', 'province1', 'postcode2', true),
(3, 1, 'YSL', 'description', 'thumbnail_photo_url' , 'cover_photo_url', 200, 4, 5, 4, 'Canada', 'street3', 'city3', 'province3', 'postcode3', true);


INSERT INTO reservations (guest_id, property_id, start_date, end_date)
VALUES
(1, 1, '2021-04-01', '2021-04-10'),
(2, 2, '2021-01-04', '2021-01-07'),
(3, 3, '2021-10-01', '2021-10-07');

INSERT INTO property_reviews(guest_id, property_id, reservation_id, rating, message)
VALUES
(1, 1, 1, 5, 'message'),
(2, 2, 2, 5, 'message'),
(3, 3, 3, 5, 'message');
