class WeekDayTranslator {
  String translate(String weekday) {
    switch (weekday) {
      case 'Mon':
        return 'Seg';
      case 'Tue':
        return 'Ter';
      case 'Wed':
        return 'Qua';
      case 'Thu':
        return 'Qui';
      case 'Fri':
        return 'Sex';
      case 'Sat':
        return 'Sáb';
      case 'Sun':
        return 'Dom';
      default:
        return 'Não encontrado';
    }
  }
}
