
void setup()
{
  size(1280, 720, P3D); 
  
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  drawCartesianPlane();
  
  drawQuadraticFunction();
  drawLinearFunction();
  drawSineWave();
}

void drawCartesianPlane()
{
  background(100);
  
  strokeWeight(1);
  color black = color(0, 0, 0);
  fill(black);
  stroke(black);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawQuadraticFunction()
{
  /*
    f(x) = x^2 - 15x - 3
  */
  
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x+= 0.1f)
  {
    circle(x * 10, ((x * x) - (x * 15) - 3), 5);
  }
}

void drawLinearFunction()
{
  /*
    f(x) = -5x + 30
  */
  
  color purple = color(195, 0, 255);
  fill(purple);
  noStroke();
  
  for (float x = -200; x <= 200; x += 0.1f)
  {
    circle(x, ((x * -5) + 30), 5);
  }
}

void drawSineWave()
{
  color cyan = color(0, 255, 255);
  fill(cyan);
  stroke(cyan);
  float frequency = 5;
  float amplitude = 25;
  
  for (float x = -25; x <= 25; x += 0.1f)
  {
    circle(x * frequency, (float)Math.sin(x) * amplitude, 5);
  }
}
