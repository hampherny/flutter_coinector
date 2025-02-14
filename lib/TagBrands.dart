// Identifier b

class TagBrand {
  static Set<TagBrand> _brands;
  int index;
  String short;
  String long;

  TagBrand(this.index, this.short, this.long);

  static Set<TagBrand> getBrands() {
    if (_brands == null) {
      _brands = {};
      _brands.add(TagBrand(0, "TRBC", "The Real Bitcoin Club"));
      _brands.add(TagBrand(1, "APAY", "Anypay"));
      _brands.add(TagBrand(2, "GOC", "GoCrypto"));
      _brands.add(TagBrand(3, "TOW", "BCH City Townsville"));
      _brands.add(TagBrand(4, "PAN", "Panmoni"));
      _brands.add(TagBrand(5, "BNB", "Binance"));
      _brands.add(TagBrand(6, "SAL", "Salamantex"));
      _brands.add(TagBrand(7, "CBUY", "CryptoBuyer"));
      _brands.add(TagBrand(8, "XPAY", "XPay"));
      _brands.add(TagBrand(9, "CAT", "Cripto Catia"));
      _brands.add(TagBrand(10, "BCOM", "Bitcoin.com"));
      _brands.add(TagBrand(11, "BARN", "Bitcoinstad Arnhem"));
      _brands.add(TagBrand(12, "CMAP", "Coinmap.org"));
      _brands.add(TagBrand(13, "DASH", "Discover Dash"));
      _brands.add(TagBrand(14, "SAT", "Satoshi Angels"));
      _brands.add(TagBrand(15, "BCHH", "BCH House Vzla"));
      _brands.add(TagBrand(16, "BCHO", "BCH Oriente Vzla"));
    }
    return _brands;
  }
}
