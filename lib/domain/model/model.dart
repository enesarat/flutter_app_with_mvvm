
class SliderObject{
  String title;
  String subTitle;
  //String image;
  SliderObject(this.title,this.subTitle);
}

class User{
  String id;
  String name;
  int numOfNotifications;
  User(this.id,this.name,this.numOfNotifications);
}

class Contacts{
  String phone;
  String link;
  String email;
  Contacts(this.phone,this.link,this.email);
}

class Authentication{
  User? user;
  Contacts? contacts;
  Authentication(this.user,this.contacts);
}

class DeviceInfo{
  String name;
  String identifier;
  String version;
  DeviceInfo(this.name,this.identifier,this.version);
}