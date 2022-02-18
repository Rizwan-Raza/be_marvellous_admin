import 'dart:html';

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
      scrapble = await webScraper.loadFullURL(path);
    }
    return scrapble;
  }

  Future<void> getPagedData(String path, int pages, int limit) async {
    if (scrapble) {
      for (int i = 0; i < pages; i++) {
        await webScraper.loadWebPage(path +
            '?page=' +
            i.toString() +
            '&limit=' +
            limit.toString() +
            '&list_type=2');

        String pageContent = webScraper.getPageContent();
        Document document =
            DomParser().parseFromString(pageContent, 'text/html');
        List<Element> elems = document.querySelectorAll(
            'body > table[width="990"] > tbody > tr > td[width="664"] > table > tbody > tr > td > div > table > tbody > tr > td[align="center"] > table > tbody > tr > td > table > tbody > tr[height="23px"] > td > table > tbody > tr');
      }
    }
  }
}
