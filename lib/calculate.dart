

class Calculate {
  static double bmiCalculate(double kilo, double boy) {
    if(boy<100 && kilo<30){
     return -1;
     
    }
    
    return (kilo / ((boy / 100) * (boy / 100)));
  }

  
  static String detail(double kilo, double boy) {
    double sonuc = bmiCalculate(kilo, boy);

    if (sonuc < 18.5) {
      return 'ideal kilonun altında';
    } else if (sonuc >= 18.5 && sonuc < 24.9) {
      return 'İdeal kiloda';
    } else if (sonuc >= 24.9 && sonuc < 29.5) {
      return 'İdeal kilonun üstünde';
    } else if (sonuc >= 29.5 && sonuc < 39.9) {
      return 'İdeal kilonun çok üstünde (obez)';
    } else if (sonuc >= 39.9) {
      return 'İdeal kilonun çok üstünde (morbid obez)';
    }
    return 'Hesaplanamadı';
  }


  static String images(double kilo, double boy) {
    double sonuc = bmiCalculate(kilo, boy);

    if (sonuc < 18.5) {
      return 'assets/underWeight.png';
    } else if (sonuc >= 18.5 && sonuc < 24.9) {
      return 'assets/normal.gif';
    } else if (sonuc >= 24.9 && sonuc < 29.5) {
      return 'assets/idealKiloUstu.gif';
    } else if (sonuc >= 29.5 && sonuc < 39.9) {
      return 'assets/obez.gif';
    } else if (sonuc >= 39.9) {
      return 'assets/morbidObez.gif';
    }
    return 'Hesaplanamadı';
  }
}
