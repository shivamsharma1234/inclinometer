

#include <Servo.h>

Servo servo1;
int pos = 90-15;
char mode;


int Laser = 4;   
int voltage = 0; 

// defines pins numbers
const int trigPin = 3;
const int echoPin = 2;
//Servo Pin
const int servo_pin = 5;
// defines variables
long duration;
int distance;

void setup()
{


  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input

  //initialize serial communication at 9600 bps:
  Serial.begin(9600);
  servo1.attach(servo_pin);

  pinMode (Laser,OUTPUT); 
  digitalWrite(Laser,LOW);  // set laser off at startup or reset

  delay(15);

  servo1.write(0);

  servo1.write(pos);
}

void loop()
{ 
  digitalWrite(Laser,HIGH);      // turning the laser on

  // Clears the trigPin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
  // Calculating the distance
  distance= duration*0.034/2;

  

  if (Serial.available())
  { 
    
    
    mode = Serial.read() ;
    //delay(1);
    //pos=Serial.read() ;
    delay(1);
    if (mode == 'G')
    { pos = 90-15;
      
      servo1.write(pos);
    }

    if (mode == 'U')
    { pos = pos + 1;
      //pos = map(pos, 0, 23, 0, 180);
      //digitalWrite(13,HIGH);
      servo1.write(pos);
      //Serial.println(pos/5);

    }

    if ( mode == 'D' )
    { pos = pos - 1;
      //pos = map(pos, 0, 23, 0, 180);
      //digitalWrite(13,LOW);
      servo1.write(pos);
      //Serial.println(pos/5); 

    }

    if (mode == 'E')
    {
      //Serial.print("Distance: ");
      for (int i = 10; i >= 0; i--) {

        Serial.println(distance);

        }
      
    }
    //delay(500);
  }
}

long microsecondsToCentimeters(long microseconds)
{
return microseconds / 29 / 2;
}
