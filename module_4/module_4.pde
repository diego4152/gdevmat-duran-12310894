Walker[] walkers = new Walker[100];

int frames = 0;

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280, 720, P3D);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    walkers[i].setGaussPos();
    walkers[i].setRandomColor();
    walkers[i].setRandomScale();
  }
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  
  return new PVector(x, y);
}

void draw()
{
  background(150);
  
  renderWalkers();
}

void renderBlackHole()
{
 
}

void renderWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].render();
    walkers[i].move(mousePos());
  }
}
