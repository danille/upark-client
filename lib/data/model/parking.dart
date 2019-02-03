class Parking {
  final String name;
  final double latitude;
  final double longitude;
  final int capacity;

  const Parking(this.name, this.latitude, this.longitude, this.capacity);

  factory Parking.fromJSON(json) {
    if (json == null) {
      return null;
    } else {
      return new Parking(
          json['name'],
          json['latitude'],
          json['longitude'],
          json['capacity']);
    }
  }
}