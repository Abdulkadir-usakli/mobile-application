class Burc {
  final String _adi;
  final String _tarihi;
  final String _detay;
  final String _kucukresim;
  final String _buyukresim;
  get adi => this._adi;
  get tarihi => this._tarihi;
  get detay => this._detay;
  get kucukresim => this._kucukresim;
  get buyukresim => this._buyukresim;

  Burc(this._adi, this._tarihi, this._detay, this._kucukresim, this._buyukresim,
      {required String adi,
      required String tarihi,
      required String detay,
      required String kucukresim,
      required String buyukresim});
}
