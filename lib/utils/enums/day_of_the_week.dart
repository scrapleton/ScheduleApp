enum DaysOfWeek {
  sonntag('Sonntag', 0),
  montag('Montag', 1),
  dienstag('Dienstag', 2),
  mittwoch('Mittwoch', 3),
  donnerstag('Donnerstag', 4),
  freitag('Freitag', 5),
  samstag('Samstag', 6);

  const DaysOfWeek(this.label, this.intValue);

  //Label is used in DropdownMenuEntry
  final String label;

  //intValue is the standard value in many langages and is also used to sort the Days Of Week
  final int intValue;

  //Get all Day Of Week ordered, and starting by a given day.
  // Montag => [.Montag, .Dienstag, .Mittwoch, .Donnerstag, .Freitag, .Samstag, . Sonntag]
  // Mittwoch => [.Mittwoch, .Donnerstag, .Freitag, .Samstag, . Sonntag, .Montag, .Dienstag]
  static List<DaysOfWeek> fullWeek(DaysOfWeek startingDay) {
    List<DaysOfWeek> myWeek = [];

    //Sort week
    List<DaysOfWeek> sortedWeek = List.from(DaysOfWeek.values);
    sortedWeek.sort((a, b) => a.intValue.compareTo(b.intValue));

    //Rearange to put startingday first
    myWeek.addAll(sortedWeek.getRange(startingDay.intValue, sortedWeek.length));
    myWeek.addAll(sortedWeek.getRange(0, startingDay.intValue));
    return myWeek;
  }
}
