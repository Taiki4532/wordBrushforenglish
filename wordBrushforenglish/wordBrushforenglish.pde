//wordBrush.pde

import processing.awt.*;
//import processing.awt.PSurfaceAWT.SmoothCanvas;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;

int backgroundColor = 30;
String sendText;
char[] chars;
float textSize = 60.0;
float lastTextX,lastTextY;
float margin = textSize;
boolean marginCheck = true;
float speed;
float max_speed;
int num,count;
PFont font;

 String extext1 = "Now your head, excuse me, is empty. I have the ticket for that. Come here, sweetie, out of the closet. Well, what do you think of that? Naked as paper to start";
 String extext2 = "But in twenty-five years she'll be silver,In fifty, gold.A living doll, everywhere you look.It can sew, it can cook,It can talk, talk, talk.";
 String extext3 = "It works, there is nothing wrong with it.You have a hole, it's a poultice.You have an eye, it's an image.My boy, it's your last resort.Will you marry it, marry it, marry it.";
    

void setup()
{
  size(1000,960);
  background(backgroundColor);
  textAlign(CENTER);
  font = loadFont("RyuminPr6N-Light-48.vlw");
  textFont(font);
  max_speed = 200;
  TextWindow textWindow = new TextWindow(this);
}

void draw(){
  reflesh(backgroundColor);
  
  speed = dist(mouseX,mouseY,pmouseX,pmouseY);

  //speed = map(speed,0,max_speed,0,10);
  
  //println(speed);
  //print(sendText);
}

void mouseDragged(){
  drawEllipse();
}

void mouseReleased(){
  marginCheck = true;
}

void drawEllipse()
{
  if(dist(mouseX,mouseY,lastTextX,lastTextY) > margin)
    marginCheck = true;
    
  if(marginCheck && count < num){
    //noStroke();
    stroke(235);
    strokeWeight(2);
    fill(235);
    textSize(textSize + speed);
    text(chars[count],mouseX,mouseY);
    lastTextX = mouseX;
    lastTextY = mouseY;
    marginCheck = false;
    count ++;
  }
}

void reflesh(int colorValue)
{
  noStroke();
  fill(colorValue,10);
  rect(0,0,width,height);
}

void textSendFromTextWindow(String temptext){
  sendText = temptext;
  num = sendText.length();
  count = 0;
  chars = new char[sendText.length()];
  for(int i = 0; i < sendText.length();i++){
    chars[i] = sendText.charAt(i);
  }
  
}

class TextWindow extends JFrame implements ActionListener{
  JTextArea textArea;
  JPanel panel;
  JButton addButton;
  JScrollPane scrollpane;
  
  wordBrushforenglish parentWindow;
  
  TextWindow(wordBrushforenglish parentWindow){
    super("Text Window");
    
    this.parentWindow = parentWindow;
    
    this.setSize(320,240);
    
    panel = new JPanel();
    panel.setLayout(new BorderLayout());
    
    addButton = new JButton("Send text");
    addButton.setActionCommand("Send text Button_Pushed");
    addButton.addActionListener(this);
    panel.add(addButton,BorderLayout.SOUTH);    

    textArea = new JTextArea(extext1+extext2+extext3);
    textArea.setLineWrap(true);
    //scrollpane = new JScrollPane(textArea);
    panel.add(textArea,BorderLayout.CENTER);
    
    this.getContentPane().add(panel);
    
    this.setVisible(true);
  }
  
 @Override
 public void actionPerformed(ActionEvent e){
 String currentText =  textArea.getText();
 parentWindow.textSendFromTextWindow(currentText);
 }
 
}
