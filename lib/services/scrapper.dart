import 'package:web_scraper/web_scraper.dart';

class Scrapper {
  final String hostname;
  late WebScraper webScraper;
  bool scrapble = false;
  Scrapper(this.hostname) {
    webScraper = WebScraper(this.hostname);
  }
  Future<bool> isEverythingOk(String path) async {
    if (!scrapble) {
      return webScraper.loadFullURL(path);
    }
    return scrapble;
  }
}
