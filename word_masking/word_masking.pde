//String s = "You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.";
String s;
ArrayList<Letter> letterList = new ArrayList<Letter>();
int x = 0;
int y = 14;

void setup() {
  size (1280, 720);
  
  s = loadStrings("http://localhost:3000/timeline/ondinafrate")[0];

  for (char letter : s.toCharArray())
  {
    if (x > width - textWidth(letter)) {
      y += 14;
      x = 0;
    }
    letterList.add(new Letter(letter, x, y, 14));
    x += textWidth(letter) + 2;
  }

  for (Letter l : letterList) {
    l.drawLetter();
  }
}

void draw () {
  background (0);
  for (Letter l : letterList) {
    l.drawLetter();
  }
  //textSize(14);
  //text(s, 0, 0, 1280, 720); 

  //noFill();
  //strokeWeight(1300);
  //ellipse(mouseX, mouseY, 1500, 1500);
}

class Letter {

  int x, y;
  int textSize;
  char letter;

  Letter(char s, int xPos, int yPos, int size) {
    x = xPos;
    y = yPos;
    letter = s;
    textSize = size;
  }

  void drawLetter() {
    float dist = dist(x, y, mouseX, mouseY);
    if (dist < 150) {
      textSize(textSize + (30 -(dist/5)));
      //if (dist > 30) {
      //  textSize(30);
      //} else {
      //  textSize(dist);
      //}
    } else {
      textSize(textSize);
    }
    text(letter, x, y);
  }
}