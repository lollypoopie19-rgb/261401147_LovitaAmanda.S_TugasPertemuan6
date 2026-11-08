program deret;

{ METODE PENGERJAAN:
  1. Setiap deret dibuat dalam satu function.
  2. Function menerima urutan suku (x) dan mengembalikan nilai suku ke-x.
  3. Program utama membaca input n, lalu memakai perulangan for
     dari 1 sampai n untuk mencetak suku-suku tiap deret.
  4. Tanda koma hanya dicetak di antara angka (tidak setelah angka terakhir). }

var
  n, i : integer;   { n = banyak suku (input), i = penghitung perulangan }

{ Deret a: 1,1,2,3,5,8,13,... (Fibonacci)
  Rumus : suku ke-x = suku sebelumnya + suku sebelum itu lagi.
  Metode: a dan b menyimpan dua suku terakhir, c menyimpan hasil
          penjumlahannya. Setiap putaran, nilai a dan b digeser maju.
  Catatan: untuk x = 1 atau 2 perulangan tidak berjalan, sehingga
           hasilnya tetap 1 (sesuai deret). }
function fibo(x : integer) : longint;
var
  a, b, c, j : longint;
begin
  a := 1;                    { suku pertama }
  b := 1;                    { suku kedua }
  for j := 3 to x do         { mulai dari suku ke-3 }
  begin
    c := a + b;              { suku baru = jumlah dua suku sebelumnya }
    a := b;                  { geser: a jadi suku kedua terakhir }
    b := c;                  { geser: b jadi suku terakhir }
  end;
  fibo := b;                 { b berisi suku ke-x }
end;

{ Deret b: 1,2,4,8,16,32,... (perpangkatan 2)
  Rumus : suku ke-x = 2 pangkat (x-1).
  Metode: mulai dari 1, lalu dikali 2 sebanyak (x-1) kali.
          Contoh x = 4 -> 1*2*2*2 = 8. }
function pangkat(x : integer) : longint;
var
  j, hasil : longint;
begin
  hasil := 1;                { suku pertama = 1 }
  for j := 2 to x do         { dikali 2 sebanyak x-1 kali }
    hasil := hasil * 2;
  pangkat := hasil;
end;

{ Deret c: 1,4,9,16,25,36,... (bilangan kuadrat)
  Rumus : suku ke-x = x * x.
  Metode: langsung dihitung tanpa perulangan. }
function kuadrat(x : integer) : longint;
begin
  kuadrat := x * x;
end;

{ Deret d: 2,6,12,20,30,42,...
  Rumus : suku ke-x = x * (x+1).
  Metode: langsung dihitung tanpa perulangan.
  Cek   : 1*2=2, 2*3=6, 3*4=12, 4*5=20, 5*6=30, 6*7=42. }
function deretd(x : integer) : longint;
begin
  deretd := x * (x + 1);
end;

{ PROGRAM UTAMA }
begin
  write('Input : ');
  readln(n);                 { baca banyak suku yang ingin ditampilkan }

  { Tampilkan deret a }
  for i := 1 to n do
  begin
    write(fibo(i));
    if i < n then write(', ');   { koma hanya jika bukan angka terakhir }
  end;
  writeln;                   { pindah baris }

  { Tampilkan deret b }
  for i := 1 to n do
  begin
    write(pangkat(i));
    if i < n then write(', ');
  end;
  writeln;

  { Tampilkan deret c }
  for i := 1 to n do
  begin
    write(kuadrat(i));
    if i < n then write(', ');
  end;
  writeln;

  { Tampilkan deret d }
  for i := 1 to n do
  begin
    write(deretd(i));
    if i < n then write(', ');
  end;
  writeln;

  readln;                    
end.