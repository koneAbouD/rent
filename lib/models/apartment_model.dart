class Apartment{
  final String code;
  final String description;
  final int numberRooms;
  final String idBuilding;

  Apartment({
    required this.code,
    required this.description,
    required this.numberRooms,
    required this.idBuilding
  });

  factory Apartment.fromData(dynamic data){
    return Apartment(code: data['code'], description: data['description'], numberRooms: data['number_rooms'], idBuilding: data['id_building']);
  }
}