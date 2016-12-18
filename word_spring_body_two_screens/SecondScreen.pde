import controlP5.*;
 
ControlP5 cp5;
 
String usernameInput;

int secondWidth = 1024;
int secondHeight = 848;

public class SecondApplet extends PApplet {
  
  public void settings() {
    size(secondWidth, secondHeight);
  }
  public void setup(){
  PFont font = createFont("arial", 24);
  cp5 = new ControlP5(this, font);
  cp5.addTextfield("Screen Name").setPosition(secondWidth/2 - 250, secondHeight/2 - 30).setSize(300, 60).setAutoClear(true);
  cp5.addBang("Submit").setPosition(secondWidth/2 + 70, secondHeight/2 - 30).setSize(130, 60);  
  }
  public void draw() {
    background(0);
    //ellipse(ballX, ballY, 50, 10);
  }
  
  void keyPressed(){
    if(key == ENTER){
      println("TEST");
      if(cp5.get(Textfield.class,"Screen Name").isFocus()){
        Submit();
      }
    }
  }
  
  void Submit() {
    print("the following text was submitted :");
    usernameInput = cp5.get(Textfield.class,"Screen Name").getText();
    print(" textInput 1 = " + usernameInput);
    loadUser(usernameInput);
    println();
  }
}