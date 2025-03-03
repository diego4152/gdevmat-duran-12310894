int frames = 0;

void setup()
{
  size(1020, 720, P3D); 
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
  background(255);
}

void draw()
{
  drawPaintSplatter();
  countFrames();
}

void drawPaintSplatter()
{
  // variables for position
  float xGaussian = randomGaussian();
  
  float xStandardDeviation = 1020;
  float xMean = 0;
  
  float x = xStandardDeviation * xGaussian + xMean;
  float y = random(-720, 720);
  
  // variables for color
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
    
  int a = int(random(10, 100));
    
  color splatterColor = color(r, g, b, a);
  
  // variables for scale
  float scaleGaussian = randomGaussian();
  
  float scaleStandardDeviation = 30;
  float scaleMean = 10;
  
  float scale = scaleStandardDeviation * scaleGaussian + scaleMean;
  
  // circle time
  fill(splatterColor);
  noStroke();
  circle(x, y, scale);
}

void countFrames()
{ 
  if (frames > 300)
  {
    background(255);
    frames = 0;
  }
  else
  {
    frames++;
  }
}
