Worksheet 6 - Stored Procedures and Functions

-- SOAL 6.1.1: Procedure to update product prices by product type
DELIMITER $$
CREATE PROCEDURE pro_naikan_harga(
    IN jenis_produk_id INT,
    IN persentase_kenaikan INT
)
BEGIN
    UPDATE produk 
    SET harga_jual = harga_jual + (harga_jual * persentase_kenaikan / 100)
    WHERE jenis_produk_id = jenis_produk_id;
END $$
DELIMITER ;

-- SOAL 6.1.2: Function to calculate age from birth date
DELIMITER $$
CREATE FUNCTION umur(tgl_lahir DATE)
RETURNS INT
BEGIN
    DECLARE umur INT;
    SET umur = YEAR(CURDATE()) - YEAR(tgl_lahir);
    
    -- Adjust age if birthday hasn't occurred yet this year
    IF DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(tgl_lahir, '%m%d') THEN
        SET umur = umur - 1;
    END IF;
    
    RETURN umur;
END $$
DELIMITER ;

-- SOAL 6.1.3: Function to categorize product prices
DELIMITER $$
CREATE FUNCTION kategori_harga(harga DOUBLE)
RETURNS VARCHAR(20)
BEGIN
    DECLARE kategori VARCHAR(20);
    
    IF harga <= 500000 THEN
        SET kategori = 'murah';
    ELSEIF harga <= 3000000 THEN
        SET kategori = 'sedang';
    ELSEIF harga <= 10000000 THEN
        SET kategori = 'mahal';
    ELSE
        SET kategori = 'sangat mahal';
    END IF;
    
    RETURN kategori;
END $$
DELIMITER ;
