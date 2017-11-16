
# Tugas 2 IF3110 Pengembangan Aplikasi Berbasis Web

## Basis data sistem

Pada web ini, kami mengenerate 2 buah basis data yaitu basis data untuk ojek online dan basis data untuk identitas. Basis data yang digunakan mengambil dari basis data tugas satu dengan modifikasi yang diperlukan.

Basis data pertama digunakan untuk menyimpan data-data yang dibutuhkan pada Identity Service. basis data ini mengandung tabel-tabel yang berhubungan dengan data user, autentikasi, dan sekaligus token untuk akses web.

Basis data kedua yaitu untuk Ojek Online Service. Isi tabel berhubungan dengan data yang digunakan ketika ojek online diakses misalnya waktu order ojek, driver, dll.

-----

## Shared Session menggunakan REST
REST yaitu singkatan dari Respresentational State Transfer adalah sebuah konsep dalam melakukan shared session / state transfer untuk menangani Web yang stateless
REST dapat diimplementasikan di HTTP 

Konsep :
- resource / sumber daya logical (berbentuk kelas biasanya)
- server : tempat menampung sumberdaya
- client : yang melakukan request pada server
- request dan response : interaksi antara client dan server
- representation : dokumen yg menjelaskan status dari sebuah resource

Prinsip
1. State dari resource diketahui hanya oleh internal dari server
2. Server tidak memiliki status dari client
3. Request dari client mengandung semua informasi untuk diproses server
4. Session state di store di client side
5. Resource bisa memiliki beberapa respresentation
6. Response mengindikasikan cacheability (bisa ketahuan perlu di cached atau tidak)
7. Opsional : client bisa fetch sebagian code server jika dibutuhkan

sumber: https://www.javacodegeeks.com/2012/10/introduction-to-rest-concepts.html

-------

## Pembangkitan Token dan expiry time

Ketika Login, user memasukkan username dan password, ketika ada di database, maka user diberi token dengan expiry time tertentu. Token digunakan agar client dapat mengakses data-data di server dan juga memvalidasi user yang bersangkutan. Token digenerate dengan library secure random yang akan menciptakan token unik.

Konsep ini membantu dalam state handling, dimana user mendapat token, sehingga server tidak perlu menanyakan ulang username dan password pengguna. Namun, user tidak akan selamanya mendapat token. Hal ini disebut dengan expire time

Expiry time digenerate sesuai kebutuhan dan dihitung menggunakan timestamp yang nilainya disimpan di database bersama dengan token

http://stackoverflow.com/questions/1592534/what-is-token-based-authentication

-----


## Kelebihan Arsitektur

Kelebihan dan kelemahan arsitektur aplikasi ini
Kelebihan :
1. Mudah melakukan pengujian karena aplikasi terbagi-bagi, tidak disatukan semuanya
2. Lebih mudah membuat security sistemnya, karena sudah dibentuk arsitektur yang baik (dibandingkan dengan monolitik)

Kelemahan :
1. Waktu untuk layanan proses seharusnya lebih lambat dibanding monolitik. Karena, pada monolitik, seluruh aplikasi berada pada alamat memory yang sama, sedangkan dengan arsitektur ini, aplikasi berada pada alamat memory yang berbeda-beda sehingga membutuhkan waktu layanan yang lebih lama

sumber: http://www.blog-hafid25.com/2015/09/arsitektur-sistem-operasi-dan.html?m=1

### Arsitektur Umum Server
![Gambar Arsitektur Umum Server](http://gitlab.informatika.org/IF3110-2017-K03-WBD7290114/TugasBesar2_2017/raw/master/arsitektur_umum.png)




## Pembagian Kerja


REST :
1. Generate token : 13515114
2. Validasi token : 13515114
3. Logout : 13515114
4. Register Service : 13515072
5. Login Service : 13515090

SOAP :
1. Add Ojek : 13515072
2. 
3. 

Web app (JSP) :
1. Halaman Login : 13515090
2. Halaman Register : 13515072
3. Halaman Profile : 13515090
4. Halaman Edit Profile : 13515090
5. Halaman Edit Location : 13515090
6. Halaman History Order : 13515114
7. Halaman History Driver : 13515114
8. Halaman Order : 13515072
9. Halaman Select Driver : 13515072
10. Halaman Complete Order : 13515072

Luthfi Fadillah 13515072 | Annisa Muzdalifa 13515090 | Iftitakhul Zakiah 13515114
