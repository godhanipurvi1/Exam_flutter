class Globals {
  static String? name;
  static int? grid;
  static int? standard;
  static String? image;
  static List<Map<String, dynamic>> students = [];
  static void addStudent(String name, int grid, int standard) {
    students.add({
      'name': name,
      'grid': grid,
      'standard': standard,
    });
  }
}
