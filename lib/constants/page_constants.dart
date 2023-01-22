class PageConstants {
  static const int PAGE_SIZE = 2;
  static const int INIT_PAGE_NUMBER = 0;

  // this is the number of unique results needed to avoid a second call
  static const double PAGE_THRESHOLD = 0.2 * PAGE_SIZE;
}
