# SISTEM TAGIHAN LISTRIK

**RAFLY KURNIAWAN**

## BUSINESS RULE

- **BR-01:** Pemakaian listrik sampai dengan 100 kWh dikenakan tarif Rp1.000/kWh.
- **BR-02:** Pemakaian listrik 101–200 kWh dikenakan tarif Rp1.500/kWh.
- **BR-03:** Pemakaian listrik di atas 200 kWh dikenakan tarif Rp2.000/kWh.
- **BR-04:** Pelanggan Premium mendapatkan diskon sebesar 5% dari biaya listrik.
- **BR-05:** Pelanggan biasa tidak mendapatkan diskon.
- **BR-06:** Biaya administrasi sebesar Rp10.000.
- **BR-07:** Pajak sebesar 5% dihitung setelah diskon.
- **BR-08:** Total tagihan = biaya listrik - diskon + pajak + biaya administrasi.

## DECOMPOSITION

Program dibagi menjadi 3 fungsi:

- `hitungBiayaListrik()` → Menentukan tarif berdasarkan pemakaian kWh dan menghitung biaya listrik.
- `hitungDiskon()` → Menghitung potongan 5% untuk pelanggan Premium.
- `hitungTotalBayarListrik()` → Menghitung total setelah diskon, pajak, dan biaya administrasi.

## SOURCE CODE

```dart
double hitungBiayaListrik(double kwh) {
  double tarif;

  if (kwh <= 100) {
    tarif = 1000;
  } else if (kwh <= 200) {
    tarif = 1500;
  } else {
    tarif = 2000;
  }

  return kwh * tarif;
}

double hitungDiskon(double biayaListrik, bool premium) {
  const double DISKON = 0.05;

  if (premium) {
    double potongan = biayaListrik * DISKON;
    return potongan;
  } else {
    return 0;
  }
}

double hitungTotalBayarListrik(
    double biayaListrik,
    double potongan) {

  const double ADMIN = 10000;
  const double PAJAK = 0.05;

  double setelahDiskon = biayaListrik - potongan;
  double pajak = setelahDiskon * PAJAK;

  double total = setelahDiskon + pajak + ADMIN;

  return total;
}

void main() {
  double totalPemakaianListrik = 101;
  bool premium = true;

  double biayaListrik =
      hitungBiayaListrik(totalPemakaianListrik);

  double potongan =
      hitungDiskon(biayaListrik, premium);

  double totalBayar =
      hitungTotalBayarListrik(biayaListrik, potongan);

  print("Pemakaian       : $totalPemakaianListrik kWh");
  print("Premium         : $premium");
  print("Biaya Listrik   : Rp$biayaListrik");
  print("Diskon          : Rp$potongan");
  print("Total Bayar     : Rp$totalBayar");
}