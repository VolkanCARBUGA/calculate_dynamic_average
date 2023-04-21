class Lesson {
  String name;
  double letterValue;
  double creditValue;
  Lesson(this.name, this.letterValue, this.creditValue);
  @override
  String toString() {
    // TODO: implement toString
    return '$name $letterValue $creditValue';
  }
}
