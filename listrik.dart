double hitungBiayaListrik(double kwh){
  double tarif;
  if(kwh <= 100){
     tarif = 1000;
  }else if(kwh <= 200){
     tarif = 1500;
  }else{
     tarif = 2000;
  }
  return kwh * tarif;

}

double hitungDiskon(double biayaListrik, bool premium){
  const double DISKON = 0.05;

  if(premium){
    double potongan = biayaListrik * DISKON;
    return potongan;
  }else {
    return 0;
  }
}

double hitungTotalBayarListrik(double biayaListrik, double potongan){
  const double ADMIN = 10000;
  const double PAJAK = 0.05;

  double setelahDiskon = biayaListrik - potongan;
  double pajak = setelahDiskon * PAJAK;

  double total = setelahDiskon + pajak + ADMIN;

  return total;
}

void main() {
  double totalPemakaianListrik = 250;
  bool premium = false;

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
// **Catatan kecil:** untuk Skenario 3, pajaknya `5% × Rp500.000 = Rp25.000`, lalu + admin Rp10.000, jadi total **Rp535.000**.