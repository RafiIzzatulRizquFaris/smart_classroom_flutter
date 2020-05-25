class AttendModel {
  int status;
  String message;
  List<DataBean> data;

  AttendModel({this.status, this.message, this.data});

  List<DataBean> _attendList;

//  AttendModel.map(dynamic obj) {
//    this._status = obj["status"];
//    this._message = obj["message"];
//    _attendList = List<DataBean>();
//    obj['data'].forEach((i){
//      _attendList.add(DataBean.mapping(i));
//    });
//    this._data = obj["data"];
//  }

  factory AttendModel.mapping(Map<String, dynamic> obj){
    return AttendModel(
      status: obj['status'],
      message: obj['message'],
      data: (obj['data'] as List).map((data) => DataBean.mapping(data)).toList(),
    );
  }

//  Map<String, dynamic> toMap() {
//    var map = new Map<String, dynamic>();
//    map["status"] = _status;
//    map["message"] = _message;
//    map["data"] = _data;
//    return map;
//  }

}

class DataBean {
  int id;
  int idMapel;
  int idSiswa;
  int rfid;
  String waktu;
  int idKelas;
  int kehadiran;
  String keterangan;
  String namaGuru;
  String tahunpelajaran;
  int status;
  String createdAt;
  String updatedAt;
  SiswaBean siswa;

  DataBean({this.id, this.idMapel, this.idSiswa, this.rfid, this.waktu, this.idKelas, this.kehadiran, this.keterangan, this.namaGuru, this.tahunpelajaran, this.status, this.createdAt, this.updatedAt, this.siswa});

  factory DataBean.mapping(Map<String, dynamic> json){
    return DataBean(
      id: json['id'],
      idSiswa: json['id_siswa'],
      rfid: json['rfid'],
      waktu: json['waktu'],
      idKelas: json['id_kelas'],
      kehadiran: json['kehadiran'],
      keterangan: json['keterangan'],
      namaGuru: json['nama_guru'],
      tahunpelajaran: json['tahunpelajaran'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      siswa: SiswaBean.map(json['siswa'])
    );
  }

//  Map<String, dynamic> toMap() {
//    var map = new Map<String, dynamic>();
//    map["id"] = _id;
//    map["idMapel"] = _idMapel;
//    map["idSiswa"] = _idSiswa;
//    map["rfid"] = _rfid;
//    map["waktu"] = _waktu;
//    map["idKelas"] = _idKelas;
//    map["kehadiran"] = _kehadiran;
//    map["keterangan"] = _keterangan;
//    map["namaGuru"] = _namaGuru;
//    map["tahunpelajaran"] = _tahunpelajaran;
//    map["status"] = _status;
//    map["createdAt"] = _createdAt;
//    map["updatedAt"] = _updatedAt;
//    map["siswa"] = _siswa;
//    return map;
//  }

}

class SiswaBean {
  int id;
  int idUser;
  int rfid;
  String nipd;
  String namaLengkap;
  String nisn;
  String tempatLahir;
  String tanggalLahir;
  int idKelas;
  String tahunMasuk;
  String alamatTinggal;
  String namaOrangtua;
  String email;
  String noHpSiswa;
  String tahunLulus;
  String createdAt;
  String updatedAt;

  SiswaBean({this.id, this.idUser, this.rfid, this.nipd, this.namaLengkap, this.nisn, this.tempatLahir, this.tanggalLahir, this.idKelas, this.tahunMasuk, this.alamatTinggal, this.namaOrangtua, this.email, this.noHpSiswa, this.tahunLulus, this.createdAt, this.updatedAt});

  factory SiswaBean.map(Map<String, dynamic> obj) {
    return SiswaBean(
      id: obj['id'],
      idUser: obj['id_user'],
      rfid: obj['rfid'],
      nipd: obj['nipd'],
      namaLengkap: obj['nama_lengkap'],
      nisn: obj['nisn'],
      tempatLahir: obj['tempat_lahir'],
      tanggalLahir: obj['tanggal_lahir'],
      idKelas: obj['id_kelas'],
      tahunMasuk: obj['tahun_masuk'],
      alamatTinggal: obj['alamat_tinggal'],
      namaOrangtua: obj['nama_orangtua'],
      email: obj['email'],
      noHpSiswa: obj['no_hp_siswa'],
      tahunLulus: obj['tahun_lulus'],
      createdAt: obj['created_at'],
      updatedAt: obj['updated_at'],
    );
  }

//  Map<String, dynamic> toMap() {
//    var map = new Map<String, dynamic>();
//    map["id"] = _id;
//    map["idUser"] = _idUser;
//    map["rfid"] = _rfid;
//    map["nipd"] = _nipd;
//    map["namaLengkap"] = _namaLengkap;
//    map["nisn"] = _nisn;
//    map["tempatLahir"] = _tempatLahir;
//    map["tanggalLahir"] = _tanggalLahir;
//    map["idKelas"] = _idKelas;
//    map["tahunMasuk"] = _tahunMasuk;
//    map["alamatTinggal"] = _alamatTinggal;
//    map["namaOrangtua"] = _namaOrangtua;
//    map["email"] = _email;
//    map["noHpSiswa"] = _noHpSiswa;
//    map["tahunLulus"] = _tahunLulus;
//    map["createdAt"] = _createdAt;
//    map["updatedAt"] = _updatedAt;
//    return map;
//  }

}