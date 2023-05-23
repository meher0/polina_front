class Temperature {
  final String users_id;
  final String value_tem;

  Temperature(this.users_id, this.value_tem);

  Temperature.fromJson(Map<String, dynamic> json)
      : users_id = json['users_id'],
        value_tem = json['value_tem'];
}
