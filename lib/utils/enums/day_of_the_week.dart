enum DaysOfWeek {
  sunday('Sonntag', 0),
  monday('Montag', 1),
  tuesday('Dienstag', 2),
  wednesday('Mittwoch', 3),
  thursday('Donnerstag', 4),
  friday('Freitag', 5),
  saturday('Samstag', 6);

  const DaysOfWeek(this.label, this.intValue);

  //Label is used in DropdownMenuEntry
  final String label;

  //intValue is the standard value in many langages and is also used to sort the Days Of Week
  final int intValue;

  static DaysOfWeek tomorrow(DaysOfWeek today) {
    if (today.intValue == DaysOfWeek.values.length - 1) {
      return DaysOfWeek.values[0];
    } else {
      return DaysOfWeek.values[today.intValue + 1];
    }
  }

  static DaysOfWeek yesterday(DaysOfWeek today) {
    if (today.intValue == 0) {
      return DaysOfWeek.values[DaysOfWeek.values.length - 1];
    } else {
      return DaysOfWeek.values[today.intValue - 1];
    }
  }

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
