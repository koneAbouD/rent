import 'apartment_model.dart';

class Tenant{
  final String name;
  final String lastName;
  final String avatar;
  final String type;
  final Map<String, dynamic> apartment;
  final List<Map<String, dynamic>> payment;

  Tenant({
    required this.name,
    required this.lastName,
    required this.avatar,
    required this.type,
    required this.apartment,
    required this.payment
  });

  Map<String, dynamic> toData() {
    return {
      'name': name,
      'lastName': lastName,
      'avatar': avatar,
      'type': type,
      'apartment': apartment,
      'payment': payment,
    };
  }

  factory Tenant.fromData( dynamic data){
    return Tenant(name: data['name'], lastName: data['last_name'], avatar: data['avatar'], type: data['type'], apartment: Map<String, dynamic>.from(data['apartment']), payment: List<Map<String, dynamic>>.from(data['payment']));
  }
}