class LoginResponse {
  bool? success;
  DataLogin? dataLogin;

  LoginResponse({this.success, this.dataLogin});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    dataLogin = json['data_login'] != null
        ? DataLogin.fromJson(json['data_login'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (dataLogin != null) {
      data['data_login'] = dataLogin!.toJson();
    }
    return data;
  }
}

class DataLogin {
  String? type;
  DataMurid? dataMurid;

  DataLogin({this.type, this.dataMurid});

  DataLogin.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    dataMurid = json['data_murid'] != null
        ? DataMurid.fromJson(json['data_murid'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (dataMurid != null) {
      data['data_murid'] = dataMurid!.toJson();
    }
    return data;
  }
}

class DataMurid {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? tglLahir;
  String? kelamin;
  String? alamat;
  int? idSekolah;
  String? picture;
  String? createdAt;
  String? updatedAt;
  Sekolah? sekolah;

  DataMurid(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.tglLahir,
      this.kelamin,
      this.alamat,
      this.idSekolah,
      this.picture,
      this.createdAt,
      this.updatedAt,
      this.sekolah});

  DataMurid.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    tglLahir = json['tgl_lahir'];
    kelamin = json['kelamin'];
    alamat = json['alamat'];
    idSekolah = json['id_sekolah'];
    picture = json['picture'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sekolah =
        json['sekolah'] != null ? Sekolah.fromJson(json['sekolah']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['tgl_lahir'] = tglLahir;
    data['kelamin'] = kelamin;
    data['alamat'] = alamat;
    data['id_sekolah'] = idSekolah;
    data['picture'] = picture;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (sekolah != null) {
      data['sekolah'] = sekolah!.toJson();
    }
    return data;
  }
}

class Sekolah {
  int? id;
  String? nama;
  int? idArea;
  bool? active;
  double? kkm;
  int? idJenjang;
  String? createdAt;
  String? updatedAt;

  Sekolah(
      {this.id,
      this.nama,
      this.idArea,
      this.active,
      this.kkm,
      this.idJenjang,
      this.createdAt,
      this.updatedAt});

  Sekolah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    idArea = json['id_area'];
    active = json['active'];
    kkm = json['kkm'];
    idJenjang = json['id_jenjang'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['id_area'] = idArea;
    data['active'] = active;
    data['kkm'] = kkm;
    data['id_jenjang'] = idJenjang;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
