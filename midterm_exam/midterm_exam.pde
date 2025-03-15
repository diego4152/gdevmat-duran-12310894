Walker w = new Walker();
Walker target = new Walker();
Walker[] walkers = new Walker[100];

int frames = 0;

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280, 720, P3D);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].acceleration = new PVector (-0.01, 0.1);
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
  renderBlackHole();
  countFrames();
}

void renderBlackHole()
{
  target.render();
  if (frames == 0)
  {
    target.setGaussPos();
  }
  //target.position = mousePos(); // BONUS: make it follow mouse
}

void renderWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].render();
    
    if (frames == 0)
    {
      walkers[i].setRandomScale();
      walkers[i].setRandomColor();
      walkers[i].setGaussPos();
    }
    else if (frames > 0)
    {
      PVector direction = PVector.sub(target.position, walkers[i].position);
      walkers[i].move(direction);
    }
  }
}

void countFrames()
{
  if (frames > 300)
  {
    background(150);
    frames = 0;
  }
  else
  {
    frames++;
  }
}
