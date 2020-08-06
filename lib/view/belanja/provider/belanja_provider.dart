import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:toko_digital/model/data_barang.dart';

class BelanjaProvider extends ChangeNotifier {
  List<BelanjaItemModel> _listBelanja = List<BelanjaItemModel>();
  ScrollController _controller = new ScrollController();

  ScrollController get controller =>_controller;

  List<BelanjaItemModel> get listBelanja => _listBelanja;
  int _id = 0;
  int get id => _id;

  int _hargaTotal = 0;
  int get hargaTotal => _hargaTotal;

  int _idTemp = 0;
  int get idTemp => _idTemp;

  void AddListBelanja({Data_barang listbelanja}) {
    if (_listBelanja.length > 0) {
      for (int i = 0; i < _listBelanja.length; i++) {
        if (_listBelanja[i]
            .databarang
            .nama_barang
            .contains(listbelanja.nama_barang)) {
          _idTemp = i;
          notifyListeners();
        }
      }

      if (!_listBelanja[_idTemp]
          .databarang
          .nama_barang
          .contains(listbelanja.nama_barang)) {
        _listBelanja.add(BelanjaItemModel(
            databarang: listbelanja,
            id: _id,
            jumlah: 1,
            harga: listbelanja.harga_barang));
        notifyListeners();
      } else {
        _listBelanja[_idTemp].jumlah++;
        notifyListeners();
        _listBelanja[_idTemp].harga = _listBelanja[_idTemp].jumlah *
            _listBelanja[_idTemp].databarang.harga_barang;
        notifyListeners();
      }
    } else {
      _listBelanja.add(BelanjaItemModel(
          databarang: listbelanja,
          id: _id,
          jumlah: 1,
          harga: listbelanja.harga_barang));
      notifyListeners();
    }
    _id++;
    notifyListeners();

    setHargaTotal();
  }

  void incrBelanjaan({index}) {
    _listBelanja[index].jumlah++;
    notifyListeners();

    _listBelanja[index].harga = _listBelanja[index].jumlah *
        _listBelanja[index].databarang.harga_barang;
    notifyListeners();

    setHargaTotal();
  }

  void decrBelanjaan({index}) {
    if (_listBelanja[index].jumlah > 1) {
      _listBelanja[index].jumlah--;
      notifyListeners();

      _listBelanja[index].harga = _listBelanja[index].jumlah *
          _listBelanja[index].databarang.harga_barang;
      notifyListeners();
    } else {
      _listBelanja.removeAt(index);
      notifyListeners();
    }
    setHargaTotal();
  }

  void setHargaTotal() {
    _hargaTotal = 0;
    notifyListeners();
    for (int i = 0; i < _listBelanja.length; i++) {
      _hargaTotal = _listBelanja[i].harga + _hargaTotal;
      notifyListeners();
    }
  }
}
