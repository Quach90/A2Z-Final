import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;

String s = "You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text. You can spell check very long text areas without compromising any performance hits. Regardless of the size of the text, UltimateSpell only sends small portions of the text to the server as needed, while the user spell checks through the text.";

Kinect2 kinect2;

int[] rawDepth;

PImage depthImg;
PImage overlayImg;

int minDepth =  100;
int maxDepth =  1300;

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
}

void draw (){
  background (0);
  textSize(14);
  //text(s, 0, 0, 1280, 720);
  text(s, 0, 0, 1024, 848);
  
  rawDepth = kinect2.getRawDepth();
  for(int x=0; x<kinect2.depthWidth;x++){
    for (int y=0; y<kinect2.depthHeight;y++){
      if (rawDepth[x+y*kinect2.depthWidth] >= minDepth && rawDepth[x+y*kinect2.depthWidth] <= maxDepth) {
      noStroke();
      fill(255);
      rect(2*x, 2*y, 2, 2);
    } else {
    }
    }
  }
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