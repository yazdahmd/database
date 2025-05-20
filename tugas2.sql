Worksheet 2
2. Tampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal
SELECT * FROM produk ORDER BY harga_jual DESC;
3. Tampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan
Select kode, nama, tmp_lahir, tgl_lahir from pelanggan;
4. Tampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
SELECT kode,nama, stok from produk WHERE stok=4;
5. Tampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
SELECT * from pelanggan WHERE tmp_lahir='jakarta';
6. Tampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda
usianya
SELECT kode, nama, tmp_lahir, tgl_lahir from pelanggan ORDER BY tgl_lahir DESC;

SOAL 2.2
1. Tampilkan data produk yang stoknya 3 dan 10
SELECT * from produk WHERE stok=3 OR stok=10;
2. Tampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu
SELECT * FROM produk WHERE harga_jual < 5000000 AND harga_jual > 500000;
3. Tampilkan data produk yang harus segera ditambah stoknya
SELECT * FROM produk WHERE min_stok > stok;
4. Tampilkan data pelanggan mulai dari yang paling muda
SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;
5. Tampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan
SELECT * FROM pelanggan WHERE tmp_lahir='jakarta' AND jk='P';
6. Tampilkan data pelanggan yang ID nya 2, 4 dan 6
SELECT * from pelanggan WHERE id IN (2,4,6);
7. Tampilkan data produk yang harganya antara 500 ribu sampai 6 juta
SELECT * FROM produk WHERE harga_jual >= 500000 AND harga_jual<= 6000000;
Mandiri

SOAL 2.3
1. Tampilkan produk yang kode awalnya huruf K dan huruf M
SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';
2. Tampilkan produk yang kode awalnya bukan huruf M
SELECT * FROM produk WHERE kode NOT LIKE 'M%';
3. Tampilkan produk-produk televisi
SELECT * FROM produk WHERE nama_produk LIKE '%televisi%';
4. Tampilkan pelanggan mengandung huruf 'SA'
SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%SA%';
5. Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
SELECT * FROM pelanggan WHERE tempat_lahir <> 'Jakarta' AND nama_pelanggan LIKE '%yo%';
6. Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '_A%';

SOAL 2.4
1. Tampilkan 2 data produk termahal
SELECT *FROM produk ORDER BY harga_beli DESC LIMIT 2;
2. Tampilkan produk yang paling murah
SELECT * FROM produk ORDER BY harga_beli ASC LIMIT 1;
3. Tampilkan produk yang stoknya paling banyak
SELECT * FROM produk ORDER BY stok DESC LIMIT 1;
4. Tampilkan dua produk yang stoknya paling sedikit
SELECT * FROM produk ORDER BY stok ASC LIMIT 2;
5. Tampilkan pelanggan yang paling muda
SELECT * FROM pelanggan ORDER BY tanggal_lahir DESC LIMIT 1;
6. Tampilkan pelanggan yang paling tua
SELECT * FROM pelanggan ORDER BY tanggal_lahir ASC LIMIT 1;



Worksheet3
Soal pertama
2. Tampilkan data produk beserta selisih stok dengan minimal stok 
SELECT id, nama, stok, min_stok, (stok - min_stok) AS selisih
FROM produk;
3. Tampilkan total asset produk secara keseluruhan
SELECT SUM(stok * harga_beli) AS total_asset
FROM produk;
4. Tampilkan data pelanggan yang lahirnya antara tahun 1980 sampai 1990
SELECT * FROM pelanggan
WHERE YEAR(tgl_lahir) BETWEEN 1980 AND 1990;
5. Tampilkan data pelanggan yang lahirnya tahun 1998
SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
6. Tampilkan data pelanggan yang berulang tahun bulan agustus
SELECT * FROM pelanggan WHERE MONTH(tgl_lahir) = 8;
7. Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang
dikurang tahun kelahiran)
SELECT nama, tmp_lahir, tgl_lahir, (YEAR(CURDATE()) - YEAR(tgl_lahir)) AS umur
FROM pelanggan;

Soal Kedua
1. Berapa jumlah pelanggan yang tahun lahirnya 1998
SELECT COUNT(*) AS jumlah_pelanggan
FROM pelanggan
WHERE YEAR(tgl_lahir) = 1998;
2. Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
SELECT COUNT(*) AS jumlah_pelanggan
FROM pelanggan
WHERE jk = 'P'
AND tmp_lahir = 'Jakarta';
3. Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
SELECT SUM(stok) AS total_stok
FROM produk
WHERE harga_jual < 10000;
4. Ada berapa produk yang mempunyai kode awal K
SELECT (SELECT COUNT(*) FROM produk WHERE kode LIKE 'K%') AS jumlah_produk;
5. Berapa harga jual rata-rata produk yang diatas 1jt
SELECT (SELECT AVG(harga_jual) FROM produk WHERE harga_jual > 1000000) AS
rata_rata_harga;
6. Tampilkan jumlah stok yang paling besar
SELECT (SELECT MAX(stok) FROM produk) AS stok_terbesar;
7. Ada berapa produk yang stoknya kurang dari minimal stok
SELECT (SELECT COUNT(*) FROM produk WHERE stok < min_stok) AS jumlah_produk;
8. Berapa total asset dari keseluruhan produk
SELECT SUM(harga_beli * stok) AS total_asset FROM produk;

Soal ketiga
Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau
kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
SELECT
  id, nama, stok,
  CASE
    WHEN stok <= min_stok THEN 'Segera belanja'
    ELSE 'Stok aman'
  END AS status_stok
FROM produk;
2. Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55
→ ‘Dewasa’, selainnya ‘Tua’
SELECT
 id,
 nama,
 (YEAR(CURDATE()) - YEAR(tgl_lahir)) AS umur,
 CASE
 WHEN (YEAR(CURDATE()) - YEAR(tgl_lahir)) < 17 THEN 'Muda'
 WHEN (YEAR(CURDATE()) - YEAR(tgl_lahir)) BETWEEN 17 AND 55 THEN 'Dewasa'
 ELSE 'Tua'
 END AS kategori_umur
FROM pelanggan;
3. Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ →
‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
SELECT 
  id,
  kode,
  nama,
  CASE 
    WHEN kode = 'TV01' THEN 'DVD Player'
    WHEN kode = 'K001' THEN 'Rice Cooker'
    ELSE 'Tidak Ada'
  END AS bonus
FROM produk;

Soal keempat
1. Tampilkan data statistik jumlah tempat lahir pelanggan
SELECT tmp_lahir, COUNT(*) AS jumlah_pelanggan
FROM pelanggan
GROUP BY tmp_lahir;
2. Tampilkan jumlah statistik produk berdasarkan jenis produk
SELECT jenis_produk, COUNT(*) AS jumlah_produk
FROM produk
GROUP BY jenis_produk;
3. Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
SELECT id, nama, (YEAR(CURDATE()) - YEAR(tgl_lahir)) AS umur
FROM pelanggan
WHERE (YEAR(CURDATE()) - YEAR(tgl_lahir)) < (
  SELECT AVG(YEAR(CURDATE()) - YEAR(tgl_lahir)) FROM pelanggan
);
4. Tampilkan data produk yang harganya diatas rata-rata harga produk
SELECT id, nama, harga_jual
FROM produk
WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
5. Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90 rb
SELECT pelanggan.id, pelanggan.nama, kartu.nama, kartu.iuran
FROM pelanggan
JOIN kartu ON pelanggan.kartu_id = kartu.id
WHERE kartu.iuran > 90000;
6. Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara
keseluruhan
SELECT * FROM produk 
WHERE harga_beli < (SELECT AVG(harga_beli) FROM produk);
7. Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
SELECT p.* 
FROM pelanggan p
JOIN kartu k ON p.id_kartu = k.id_kartu
WHERE k.diskon > 0.03;