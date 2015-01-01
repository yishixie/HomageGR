// Yishi Xie & Cliff Lee & Greg Singer
// Arduino
// 4 sliders & sound
import ddf.minim.*;

Minim minim;
AudioInput in;
float n=1000.0;
float n1=70.0;
float n2=0.0;
import cc.arduino.*;
import processing.serial.*;
Arduino arduino;
//boolean sensorCircle==false;

void setup() {
  minim = new Minim(this);
  size(750, 750);
  // set next line for the Arduino hardware
  //arduino = new Arduino(this, Arduino.list()[0], 57600);
  
  in = minim.getLineIn();
    in.enableMonitoring();
  arduino = new Arduino(this, "/dev/tty.usbmodem1431", 57600);
}

void draw() {
  //noStroke();
  //scale(1.5,1.5);

  int sensorValueRed = arduino.analogRead(0)/4;
  int sensorValueGreen = arduino.analogRead(1)/4;
  int sensorValueBlue = arduino.analogRead(3)/4;
  int sensorValueMagenta = arduino.analogRead(3)/4;
  float sensorXa = arduino.analogRead(0)/6.66;
  float sensorXb = arduino.analogRead(1)/6.66;
  float sensorXc = arduino.analogRead(1)/6.66;
  float sensorXd = arduino.analogRead(3)/6.66;
  //float sensorX1 = arduino.analogRead(0)/5;
  //float sensorX2 = arduino.analogRead(1)/5;
  float sensorX3 = arduino.analogRead(2)/5;
  //float sensorX4 = arduino.analogRead(3)/5;
  float sensorStroke = arduino.analogRead(4);
  float sensorStroke1 = arduino.analogRead(1)/100;
  float sensorStroke2 = arduino.analogRead(2)/100;
  float sensorStroke3 = arduino.analogRead(3)/100;
n = n+0.1;
n1 = n+0.1;
n2 = n+0.1;

  float noisey = noise(n)*width;
  float noisey1 = noise(n1)*width;
  float noisey2 = noise(n2)*width;
  //stroke(noisey/4,noisey1/5,noisey2/6,sensorStroke*3); 
 //stroke(noisey/6,noisey1/5,noisey2/4,sensorStroke);
 stroke(noisey/6,noisey1/7,noisey/5); 
  //println(sensorStroke+noisey);
  strokeWeight(noisey/9);
  scale(1.5, 1.5);
 
  
  //small circles in top left
  ellipse(0, 0, sensorX3, sensorX3); //1
  fill(sensorValueBlue, 50, 255-sensorValueBlue, 0);
  ellipse(0, 0, 100+sensorX3, 100+sensorX3);//2
  fill(sensorValueBlue, 50, 255-sensorValueBlue, 50);
  ellipse(0, 0, 200+sensorX3, 200+sensorX3);//3
  fill(sensorValueBlue, 50, 255-sensorValueBlue, 100);
  ellipse(0, 0, 300+sensorX3, 300+sensorX3);//4
  fill(sensorValueBlue, 50, 255-sensorValueBlue, 150);
  ellipse(0, 0, 400+sensorX3, 400+sensorX3);//5
  fill(sensorValueBlue, 50, 255-sensorValueBlue, 200);
  ellipse(0, 0, 500+sensorX3, 500+sensorX3);//6 top left big
  fill(sensorValueBlue, 50, 255-sensorValueBlue, 250);


  //small circles in top right
  ellipse(500, 0, sensorX3, sensorX3); //1
  fill(50, 70+sensorValueBlue, sensorValueBlue, 0);
  ellipse(500, 0, 100+sensorX3, 100+sensorX3);//2
  fill(50, 70+sensorValueBlue, sensorValueBlue, 50);
  ellipse(500, 0, 200+sensorX3, 200+sensorX3);//3
  fill(50, 70+sensorValueBlue, sensorValueBlue, 100);
  ellipse(500, 0, 300+sensorX3, 300+sensorX3);//4
  fill(50, 70+sensorValueBlue, sensorValueBlue, 150);
  ellipse(500, 0, 400+sensorX3, 400+sensorX3);//5
  fill(50, 70+sensorValueBlue, sensorValueBlue, 200);
  ellipse(500, 0, 500+sensorX3, 500+sensorX3);//6 top right big
  fill(50, 70+sensorValueBlue, sensorValueBlue, 250);

  //small circles in bottom left
  ellipse(0, 500, sensorX3, sensorX3); //1
  fill(110+sensorValueBlue, 220-sensorValueBlue, 70, 0);
  ellipse(0, 500, 100+sensorX3, 100+sensorX3);//2
  fill(110+sensorValueBlue, 220-sensorValueBlue, 70, 50);
  ellipse(0, 500, 200+sensorX3, 200+sensorX3);//3
  fill(110+sensorValueBlue, 220-sensorValueBlue, 70, 100);
  ellipse(0, 500, 300+sensorX3, 300+sensorX3);//4
  fill(110+sensorValueBlue, 220-sensorValueBlue, 70, 150);
  ellipse(0, 500, 400+sensorX3, 400+sensorX3);//5
  fill(110+sensorValueBlue, 220-sensorValueBlue, 70, 200);
  ellipse(0, 500, 500+sensorX3, 500+sensorX3);//6 bottom left big
  fill(110+sensorValueBlue, 220-sensorValueBlue, 70, 250);

  //small circles in bottom right
  ellipse(500, 500, sensorX3, sensorX3); //1
  fill(sensorValueBlue, 50, 130+sensorValueBlue, 0);
  ellipse(500, 500, 100+sensorX3, 100+sensorX3);//2
  fill(sensorValueBlue, 50, 130+sensorValueBlue, 50);
  ellipse(500, 500, 200+sensorX3, 200+sensorX3);//3
  fill(sensorValueBlue, 50, 130+sensorValueBlue, 100);
  ellipse(500, 500, 300+sensorX3, 300+sensorX3);//4
  fill(sensorValueBlue, 50, 130+sensorValueBlue, 150);
  ellipse(500, 500, 400+sensorX3, 400+sensorX3);//5
  fill(sensorValueBlue, 50, 130+sensorValueBlue, 200);
  ellipse(500, 500, 500+sensorX3, 500+sensorX3);//6 bottom right big


  //small triangles in top left
  triangle(0, 0, 0, 0, 0, 0+sensorXa); //1
  fill(sensorValueBlue, 50, sensorValueMagenta, 0);
  triangle(0, 0, 100, 0, 0, 70+sensorXa);//2
  fill(sensorValueBlue, 50, sensorValueMagenta, 50);
  triangle(0, 0, 200, 0, 0, 140+sensorXc);//3
  fill(sensorValueBlue, 50, sensorValueMagenta, 100);
  triangle(0, 0, 300, 0, 0, 210+sensorXa);//4
  fill(sensorValueBlue, 50, sensorValueMagenta, 150);
  triangle(0, 0, 400, 0, 0, 280+sensorXd);//5
  fill(sensorValueBlue, 50, sensorValueMagenta, 200);
  triangle(sensorValueRed, sensorValueMagenta, 500, 0, 0, 350+sensorXb);//6 top left big
  fill(sensorValueBlue, 50, sensorValueMagenta, 250);

  //small triangles in top right 
  triangle(100, 0, 500, 0, 500, 280+sensorXb);//1
  fill(50, sensorValueRed, sensorValueBlue, 50);
  triangle(200, 0, 500, 0, 500, 210+sensorXa);//2
  fill(50, sensorValueRed, sensorValueBlue, 100);
  triangle(300, 0, 500, 0, 500, 140+sensorXb);//3
  fill(50, sensorValueRed, sensorValueBlue, 150);
  triangle(400, 0, 500, 0, 500, 70+sensorXa);//4
  fill(50, sensorValueRed, sensorValueBlue, 200);
  //triangle(0, 0, sensorValueBlue, sensorValueGreen, 500, 350+sensorXd); //5 top right
   for(int i = 400; i < 500; i++)
  {
    stroke(0);
  triangle(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 , 500, 350+sensorXd); 
  }
  fill(50, sensorValueRed, sensorValueBlue, 250);

 
  
  //small triangles in bottom left 
  triangle(0, 500, 0, 420-sensorXb, 100, 500); //1
  fill(sensorValueRed, sensorValueGreen, 70, 50);
  triangle(0, 500, 0, 350-sensorXc, 200, 500); //2
  fill(sensorValueRed, sensorValueGreen, 70, 100);
  triangle(0, 500, 0, 280-sensorXb, 300, 500); //3
  fill(sensorValueRed, sensorValueGreen, 70, 150);
  triangle(0, 500, 0, 210-sensorXa, 400, 500); //4
  fill(sensorValueRed, sensorValueGreen, 70, 200);
  triangle(sensorValueRed, sensorValueBlue, 0, 150-sensorXc, 500, 500); //5 bottom left 
  fill(sensorValueRed, sensorValueGreen, 70, 250);


  //small triangles in bottom right  

  triangle(500, 500, 400, 500, 500, 420-sensorXd);//1
  fill(sensorValueMagenta, 50, sensorValueGreen, 50);
  triangle(500, 500, 300, 500, 500, 350-sensorXc);//2
  fill(sensorValueMagenta, 50, sensorValueGreen, 100);
  triangle(500, 500, 200, 500, 500, 280-sensorXa);//3
  fill(sensorValueMagenta, 50, sensorValueGreen, 150);
  triangle(500, 500, 100, 500, 500, 210-sensorXd);//4
  fill(sensorValueMagenta, 50, sensorValueGreen, 200);
  triangle(500-sensorValueMagenta, 500-sensorValueRed, 0, 500, 500, 140-sensorXc); //5 bottom right
  fill(sensorValueMagenta, 50, sensorValueGreen, 250);

  //println(sensorValueMagenta);
  /*
    background(0);
  for (int x=0; x < width; x++) {
    float noiseVal = noise((sensorValueRed+x)*noiseScale, 
                            sensorStroke*noiseScale);
    stroke(noiseVal*255);
    line(x, mouseY+noiseVal*80, x, height);
  }
    */
    
  //String monitoringState = in.isMonitoring() ? "enabled" : "disabled";
  //text( "Input monitoring is currently " + monitoringState + ".", 5, 15 );
}
/*
void keyPressed()
{
  if ( key == 'm' || key == 'M' )
  {
    if ( in.isMonitoring() )
    {
      in.disableMonitoring();
    }
    else
    {
      in.enableMonitoring();
    }
  }
}
*/


