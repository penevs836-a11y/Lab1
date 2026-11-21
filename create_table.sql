-- Post_Office_25: создание таблиц (CREATE TABLE)

CREATE TABLE Types_of_correspondence (
    Type_ID SERIAL PRIMARY KEY,
    Type_name VARCHAR(100) NOT NULL,
    Packaging VARCHAR(100) NOT NULL,
    Min_weight NUMERIC(10, 2) NOT NULL,
    Max_weight NUMERIC(10, 2) NOT NULL,
    Min_length NUMERIC(10, 2) NOT NULL,
    Min_width NUMERIC(10, 2) NOT NULL,
    Min_height NUMERIC(10, 2) NOT NULL,
    Max_length NUMERIC(10, 2) NOT NULL,
    Max_width NUMERIC(10, 2) NOT NULL,
    Max_height NUMERIC(10, 2) NOT NULL,
    CHECK (Min_weight >= 0),
    CHECK (Max_weight >= Min_weight),
    CHECK (Min_length >= 0 AND Max_length >= Min_length),
    CHECK (Min_width >= 0 AND Max_width >= Min_width),
    CHECK (Min_height >= 0 AND Max_height >= Min_height)
);

CREATE TABLE Correspondence (
    Track_number VARCHAR(30) PRIMARY KEY,
    Type_ID INTEGER NOT NULL,
    Weight NUMERIC(10, 2) NOT NULL,
    Length NUMERIC(10, 2) NOT NULL,
    Width NUMERIC(10, 2) NOT NULL,
    Height NUMERIC(10, 2) NOT NULL,
    Sender_ID INTEGER NOT NULL,
    Stamp_amount NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (Type_ID) REFERENCES Types_of_correspondence(Type_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CHECK (Weight > 0),
    CHECK (Length > 0 AND Width > 0 AND Height > 0),
    CHECK (Sender_ID > 0),
    CHECK (Stamp_amount >= 0)
);
