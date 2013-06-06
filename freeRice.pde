import java.awt.Robot; 
import java.awt.AWTException;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.awt.MouseInfo;
import java.awt.PointerInfo;
import java.awt.Point;


int total;
int step;
Robot robot;

void setup(){
 size(100, 100);
 frameRate(1); //0.3
 String[] totalData = loadStrings("total.txt");
 total = int(totalData[0]);
 
 try{
   robot = new Robot();
 }catch(AWTException e){
   e.printStackTrace();
 }
 robot.setAutoDelay(10); //set short delay
 robot.mouseMove(1413,9); //move to spotlight
 click();
 type("safari"); 
 typeEnter();
 robot.delay(1500);
 robot.mouseMove(248, 56); //move to URL bar
 click(); click(); click();
 type("freerice.com");
}

void draw(){
//  Point loc = MouseInfo.getPointerInfo().getLocation();
//  println(loc.x+", "+loc.y);

//  switch(step){
//    case 1:
//      robot.mouseMove(1413,9);
//      mousePress();
//      break;
//      
//    case 2:
//      type("safari");
//      break;
//     
//    case 3:
//      typeEnter();
//      break;
//  }
//  step++;
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
