class Person {
  String? name;
  String? surname;

  Person({
    this.name,
    this.surname,
  });

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
  }
}
