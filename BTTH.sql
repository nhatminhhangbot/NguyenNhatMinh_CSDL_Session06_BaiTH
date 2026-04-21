CREATE DATABASE db_session06_btth;
USE db_session06_btth;

CREATE TABLE Users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL
);

CREATE TABLE Hotels (
	hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_name VARCHAR(100) NOT NULL,
    hotel_rating FLOAT
);

CREATE TABLE Bookings (
	booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    hotel_id INT,
    price DECIMAL(18, 2),
    booking_status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);

INSERT INTO Users VALUES 
(1,'Nguyễn Văn A'), (2,'Trần Thị B'), (3,'Lê Văn C'), (4,'Phạm Minh D'), (5,'Hoàng Gia E'),
(6,'Vũ Hải F'), (7,'Đặng Thu G'), (8,'Bùi Quang H'), (9,'Đỗ Thùy I'), (10,'Ngô Bảo K'),
(11,'Lý Triều L'), (12,'Phan Nam M'), (13,'Trịnh Văn N'), (14,'Hồ Xuân O'), (15,'Trương Mỹ P'),
(16,'Đinh Quang Q'), (17,'Lương Gia R'), (18,'Võ Văn S'), (19,'Diệp Lan T'), (20,'Cao Minh U');


INSERT INTO Hotels VALUES 
(101,'Sheraton',5), 
(102,'InterContinental',5), 
(103,'Pullman',5), 
(104,'Park Hyatt',5), 
(105,'Marriott',5),
(106,'Novotel',4), 
(107,'Liberty Central',4), 
(108,'Muong Thanh',4), 
(109,'Vissai',4), 
(110,'Edenstar',4),
(111,'Ibis',3), 
(112,'A25 Hotel',3), 
(113,'Little Hanoi',3), 
(114,'Floral Hotel',3), 
(115,'Lavender',3),
(116,'RedDoorz Lux',4), 
(117,'Vinpearl Resort',5), 
(118,'FLC Luxury',5), 
(119,'Boutique Hotel',3), 
(120,'Rex Hotel',5);

INSERT INTO Bookings VALUES 
(1,1,101,30000000,'COMPLETED'), 
(2,1,102,25000000,'COMPLETED'), 
(3,1,106,60000000,'COMPLETED'),                           
(4,2,103,55000000,'COMPLETED'),                             
(5,3,101,10000000,'COMPLETED'), 
(6,3,101,-2000000,'COMPLETED'), 
(7,4,117,70000000,'COMPLETED'),                           
(8,5,108,12000000,'COMPLETED'), 
(9,5,109,40000000,'COMPLETED'), 
(10,6,120,45000000,'COMPLETED'), 
(11,6,101,10000000,'COMPLETED'),
(12,7,111,5000000,'PENDING'),                                
(13,8,104,80000000,'COMPLETED'),                            
(14,9,105,15000000,'COMPLETED'), 
(15,9,117,40000000,'COMPLETED'),
(16,10,110,51000000,'COMPLETED'),                            
(17,11,102,20000000,'COMPLETED'),
(18,12,103,10000000,'COMPLETED'),
(19,1,101,5000000,'COMPLETED'),                               
(20,13,120,90000000,'COMPLETED');

SELECT u.user_name AS 'Tên khách hàng', h.hotel_rating AS 'Hạng khách sạn', SUM(b.price) AS 'Tổng chi tiêu'
FROM Bookings AS b
JOIN Hotels AS h
ON b.hotel_id = h.hotel_id
JOIN Users AS u
ON b.user_id = u.user_id
WHERE b.booking_status = 'COMPLETED'
GROUP BY u.user_name, h.hotel_rating
HAVING SUM(b.price) > 50000000
ORDER BY h.hotel_rating DESC, 'Tổng chi tiêu' DESC;