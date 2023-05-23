class Humidite {
  final String users_id;
  final String value_hum;

  Humidite(this.users_id, this.value_hum);

  Humidite.fromJson(Map<String, dynamic> json)
      : users_id = json['users_id'],
        value_hum = json['value_hum'];
}
