import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

String s = "You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.";

Kinect2 kinect2;

int[] rawDepth;

ArrayList<Letter> letterList = new ArrayList<Letter>();
int x = 0;
int y = 14;

PImage depthImg;
PImage overlayImg;

int minDepth =  100;
int maxDepth =  2000;

void setup(){
  //size (1280, 720);
  size (1024, 848);
  
  kinect2 = new Kinect2(this);
  //kinect2.initVideo();
  kinect2.initDepth();
  //kinect2.initIR();
  //kinect2.initRegistered();
  // Start all data
  kinect2.initDevice();
  depthImg = new PImage(kinect2.depthWidth*2, kinect2.depthHeight*2);
  
  for (char letter : s.toCharArray())
  {
    if (x > width - textWidth(letter)) {
      y += 14;
      x = 0;
    }
    letterList.add(new Letter(letter, x, y, 14));
    x += textWidth(letter) + 2;
  }
}

void draw (){
  background (0);
  //textSize(14);
  //text(s, 0, 0, 1280, 720);
  //text(s, 0, 0, 1024, 848);
  
  rawDepth = kinect2.getRawDepth();
  for (Letter l : letterList) {
    l.drawLetter();
  }
  
  //for(int x=0; x<kinect2.depthWidth;x++){
  //  for (int y=0; y<kinect2.depthHeight;y++){
  //    if (rawDepth[x+y*kinect2.depthWidth] >= minDepth && rawDepth[x+y*kinect2.depthWidth] <= maxDepth) {
  //    noStroke();
  //    fill(255);
  //    rect(2*x, 2*y, 2, 2);
  //  } else {
  //  }
  //  }
  //}
}

void keyPressed() {
  if (key == 'a') {
    minDepth = constrain(minDepth+100, 0, maxDepth);
  } else if (key == 's') {
    minDepth = constrain(minDepth-100, 0, maxDepth);
  } else if (key == 'z') {
    maxDepth = constrain(maxDepth+100, minDepth, 1165952918);
  } else if (key =='x') {
    maxDepth = constrain(maxDepth-100, minDepth, 1165952918);
  }
  println("THRESHOLD: [" + minDepth + ", " + maxDepth + "]");
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
    //float dist = dist(x, y, mouseX, mouseY);
    if (rawDepth[(x/2)+(y/2)*kinect2.depthWidth] >= minDepth && rawDepth[(x/2)+(y/2)*kinect2.depthWidth] <= maxDepth) {
    float depthmap = map(rawDepth[(x/2)+(y/2)*kinect2.depthWidth], minDepth, maxDepth, 0, 20);
    textSize(14 + depthmap);
    //if (dist < 150) {
    //  textSize(textSize + (30 -(dist/5)));
    //  //if (dist > 30) {
    //  //  textSize(30);
    //  //} else {
    //  //  textSize(dist);
    //  //}
    //} else {
    //  textSize(textSize);
    //}
    }else{
      textSize(34);
    }
    text(letter, x, y);
  }
}