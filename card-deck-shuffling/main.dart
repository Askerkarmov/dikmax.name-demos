import "dart:html";
import "dart:math";

class Card {
  String rank;
  String suit;

  Card(this.rank, this.suit);

  Element get html =>
    new Element.div()
      ..classes.addAll(["card", "rank-" + rank.toLowerCase(), suit])
      ..append(new Element.div()
        ..classes.add("rank")
        ..appendText(rank))
      ..append(new Element.div()
        ..classes.add("suit")
        ..appendHtml("&" + suit + ';'));
}

class Deck {
  List<Card> deck = <Card>[];

  Deck() {
    sort();
  }

  /**
   * Changes deck back to starting order
   */
  void sort() {
    deck = <Card>[];
    for (String rank in ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]) {
      for (String suit in ["diams", "hearts", "spades", "clubs"]) {
        deck.add(new Card(rank, suit));
      }
    }
  }

  /**
   * Performs [Fisher–Yates shuffle](http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle).
   */
  void shuffle() {
    Random random = new Random();
    for (int i = deck.length - 1; i > 0; --i) {
      int j = random.nextInt(i);
      // Swap i-th and j-th cards
      Card tmp = deck[j];
      deck[j] = deck[i];
      deck[i] = tmp;
    }
  }

  void draw() {
    Element table = querySelector(".table");
    table.innerHtml = "";
    var width = (window.innerWidth - 115) / 51;
    for (int i = 0; i < deck.length; ++i) {
      Element cardHtml = deck[i].html;
      cardHtml.style
        ..position = "absolute"
        ..left = "${20 + i * width}px";
      table.append(cardHtml);
    }
  }
}

void main() {
  var deck = new Deck();
  deck.draw();

  querySelector(".sort").onClick.listen((e) {
    deck.sort();
    deck.draw();
  });
  querySelector(".shuffle").onClick.listen((e) {
    deck.shuffle();
    deck.draw();
  });
  window.onResize.listen((e) => deck.draw());
}
