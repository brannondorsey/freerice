import java.awt.Robot; 
import java.awt.AWTException;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.awt.MouseInfo;
import java.awt.PointerInfo;
import java.awt.Point;

int total;
int ansNum = 1; 
int pageLoadTime = 2000;
String[] totalData;
String pathToDataFolder;
Robot robot;


void setup(){
 size(100, 100);
 frameRate(0.6); //0.3
 pathToDataFolder = savePath("data");
 totalData = loadStrings(pathToDataFolder+"/total.txt");
 total = int(totalData[1]);
 
 try{
   robot = new Robot();
 }catch(AWTException e){
   e.printStackTrace();
 }
 getToFreeRiceStart();
}

void draw(){
//  Point loc = MouseInfo.getPointerInfo().getLocation();
//  println(loc.x+", "+loc.y);
  int answerPosXValue = 425;
  int answerPosYValue = 415;
  
  ansNum = ceil(random(4)); //randomly chooses one of four images
  switch(ansNum){
    case 1:
      answerPosYValue = 415; //answer 1
      break;
    case 2:
      answerPosYValue = 459; //answer 2
      break;
    case 3:
      answerPosYValue = 495; //answer 3
      break;
    case 4:
      answerPosYValue = 534; //answer 4
      break;
  }
  robot.mouseMove(answerPosXValue, answerPosYValue); //move to answer
  click();
  if(ansNum == 4){
    total+=10;
    String[] data = {totalData[0], ""+total};
    saveStrings(pathToDataFolder+"/total.txt", data);
  }
}

void getToFreeRiceStart(){
 robot.setAutoDelay(10); //set short delay
 robot.mouseMove(1413,9); //move to spotlight
 click();
 type("safari"); 
 typeEnter();
 robot.delay(pageLoadTime);
 robot.mouseMove(248, 56); //move to URL bar
 click(); click(); click();
 type("freerice.com");
 typeEnter();
 robot.delay(pageLoadTime);
 robot.mouseMove(139, 225); //move off of popup add
 click();
 robot.mouseMove(602, 375); //select first answer on homepage
 click();
 robot.setAutoDelay(1); //remove auto delay 
}

void type(String needsTyped){
  if(needsTyped.equals("safari")){
    robot.keyPress(KeyEvent.VK_S);
    robot.keyRelease(KeyEvent.VK_S);
    robot.keyPress(KeyEvent.VK_A);
    robot.keyRelease(KeyEvent.VK_A);
    robot.keyPress(KeyEvent.VK_F);
    robot.keyRelease(KeyEvent.VK_F);
    robot.keyPress(KeyEvent.VK_A);
    robot.keyRelease(KeyEvent.VK_A);
    robot.keyPress(KeyEvent.VK_R);
    robot.keyRelease(KeyEvent.VK_R);
    robot.keyPress(KeyEvent.VK_I);
    robot.keyRelease(KeyEvent.VK_I);
  }
  else if(needsTyped.equals("freerice.com")){
    robot.keyPress(KeyEvent.VK_F);
    robot.keyRelease(KeyEvent.VK_F);
    robot.keyPress(KeyEvent.VK_R);
    robot.keyRelease(KeyEvent.VK_R);
    robot.keyPress(KeyEvent.VK_E);
    robot.keyRelease(KeyEvent.VK_E);
    robot.keyPress(KeyEvent.VK_E);
    robot.keyRelease(KeyEvent.VK_E);
    robot.keyPress(KeyEvent.VK_R);
    robot.keyRelease(KeyEvent.VK_R);
    robot.keyPress(KeyEvent.VK_I);
    robot.keyRelease(KeyEvent.VK_I);
    robot.keyPress(KeyEvent.VK_C);
    robot.keyRelease(KeyEvent.VK_C);
    robot.keyPress(KeyEvent.VK_E);
    robot.keyRelease(KeyEvent.VK_E);
    robot.keyPress(KeyEvent.VK_PERIOD);
    robot.keyRelease(KeyEvent.VK_PERIOD);
    robot.keyPress(KeyEvent.VK_C);
    robot.keyRelease(KeyEvent.VK_C);
    robot.keyPress(KeyEvent.VK_O);
    robot.keyRelease(KeyEvent.VK_O);
    robot.keyPress(KeyEvent.VK_M);
    robot.keyRelease(KeyEvent.VK_M); 
  }
//  for(int i = 0; i < needsTyped.length(); i++){
//    char currentChar = needsTyped.charAt(i);
//    println(int(currentChar));
//    robot.keyPress(currentChar);
//    robot.keyRelease(currentChar);
//  }
}

void typeEnter(){
 robot.keyPress(KeyEvent.VK_ENTER);
 robot.keyRelease(KeyEvent.VK_ENTER);
}

void click(){
  robot.mousePress(InputEvent.BUTTON1_MASK);
  robot.mouseRelease(InputEvent.BUTTON1_MASK);
}
