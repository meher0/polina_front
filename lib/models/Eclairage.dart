class Eclairage {
  final String users_id;
  final String value_ecl;

  Eclairage(this.users_id, this.value_ecl);

  Eclairage.fromJson(Map<String, dynamic> json)
      : users_id = json['users_id'],
        value_ecl = json['value_ecl'];
}
