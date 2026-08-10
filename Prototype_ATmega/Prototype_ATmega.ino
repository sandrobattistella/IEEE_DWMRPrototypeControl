int i = 0;
int aux = 0;
int DC_rasp[2] = {0,0};
char option = 7;

void setup() 
{
  Serial.begin(230400);
  pinMode(3,OUTPUT);
  pinMode(11,OUTPUT);  
  TCCR2A = 0xA3;
  TCCR2B = option;
}

void loop() 
{
  if (Serial.available())
  {
    aux = Serial.read();
    if (aux == 1)
    {
      while(Serial.available() < 2)
      {
      }
      while(i < 2)
      {
        DC_rasp[i] = Serial.read();
        i++;
      }
      i = 0;
      OCR2B = DC_rasp[0];
      OCR2A = DC_rasp[1];
    }
  }
}
