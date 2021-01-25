class Instructor {
  String username;
  String email;
  String password;
  Instructor({this.password, this.username, this.email});
}

List<Instructor> instructorList = [
  Instructor(
    username: "Niel Bor",
    email: "ins1@flight.com",
    password: "test123",
  ),
  Instructor(
    username: "Thomas Edison",
    email: "ins2@flight.com",
    password: "test123",
  ),
  Instructor(
    username: "Noel Peterson",
    email: "ins3@flight.com",
    password: "test123",
  )
];
