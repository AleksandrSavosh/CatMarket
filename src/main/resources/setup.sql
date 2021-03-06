DROP TABLE IF EXISTS ACCOUNT;

CREATE TABLE IF NOT EXISTS ACCOUNT (
  LOGIN    NVARCHAR(25) PRIMARY KEY,
  PASSWORD NVARCHAR(25)
);

DROP TABLE IF EXISTS PRODUCT;

CREATE TABLE IF NOT EXISTS PRODUCT (
  BREAD      NVARCHAR(50) PRIMARY KEY,
  PRICE      DECIMAL(15, 2),
  HAIR_TYPE  NVARCHAR(25),
  LIFE_TIME  INT,
  MAX_WEIGHT INT,
  IMG_NAME   NVARCHAR(50)
);

DROP TABLE IF EXISTS ORDERS;

CREATE TABLE IF NOT EXISTS ORDERS (
  ID                  INT identity PRIMARY KEY,
  FIO                 NVARCHAR(255),
  PHONE               NCHAR(25),
  EMAIL               NVARCHAR(255),
  DELIVERY_ADDRESS    NVARCHAR(255),
  PAYMENT_DESCRIPTION NVARCHAR(255),
  TOTAL_PRICE         DECIMAL(15, 2),
  STATUS              char
);

DROP TABLE IF EXISTS ORDER_PRODUCT;

CREATE TABLE IF NOT EXISTS ORDER_PRODUCT (
  ORDER_ID INT,
  BREAD    NVARCHAR(50),
  COUNTS   INT,
  PRIMARY KEY (ORDER_ID, BREAD),
  CONSTRAINT ORDER_PRODUCT_ORDER_ID_FK FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ID),
  CONSTRAINT ORDER_PRODUCT_BREAD_FK FOREIGN KEY (BREAD) REFERENCES PRODUCT (BREAD)
);

INSERT INTO ACCOUNT (LOGIN, PASSWORD)
  SELECT 'admin', 'adminpwd';

INSERT INTO PRODUCT (BREAD, PRICE, HAIR_TYPE, LIFE_TIME, MAX_WEIGHT, IMG_NAME)
  SELECT 'Maine coon', 1000, 'Semi-long hair', 20, 12, '1.jpg';

INSERT INTO PRODUCT (BREAD, PRICE, HAIR_TYPE, LIFE_TIME, MAX_WEIGHT, IMG_NAME)
  SELECT 'Ocicat', 500, 'Short hair', 15, 7, '2.jpg';

INSERT INTO PRODUCT (BREAD, PRICE, HAIR_TYPE, LIFE_TIME, MAX_WEIGHT, IMG_NAME)
  SELECT 'Abyssinian cat', 1500, 'Short hair', 15, 5, '3.jpg';

INSERT INTO PRODUCT (BREAD, PRICE, HAIR_TYPE, LIFE_TIME, MAX_WEIGHT, IMG_NAME)
  SELECT 'American bobtail', 500, 'Long hair', 13, 9, '4.jpg';


INSERT INTO PRODUCT (BREAD, PRICE, HAIR_TYPE, LIFE_TIME, MAX_WEIGHT, IMG_NAME)
  SELECT 'Oregon rex', 1000, 'Short curly hair', 15, 5, '5.jpg';