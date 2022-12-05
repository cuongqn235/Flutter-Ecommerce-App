class AppConvert {
  static String dateFormat(String date) {
    try {
      var dateTime = DateTime.parse(date);
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } catch (e) {
      return '';
    }
  }
}
