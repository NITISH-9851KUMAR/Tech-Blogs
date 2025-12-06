CREATE TABLE posts(
    pid INT AUTO_INCREMENT PRIMARY KEY,
    pTitle VARCHAR(150),
    pContent longtext,
    pCode longtext,
    pPic VARCHAR(100),
    pDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    catId INT,
    userId INT
);
#Make catId as foreign key
#ALTER TABLE posts ADD CONSTRAINT FOREIGN KEY (catId) REFERENCES categories(cid);

#Also Make Foreign Key userId
# ALTER TABLE posts ADD CONSTRAINT FOREIGN KEY (userId) REFERENCES user_details(id);