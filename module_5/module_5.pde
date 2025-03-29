Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0.0, -0.4);

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
  
  
  for (int i = 0; i < walkers.length; i++)
  {
    float mass = i;
    walkers[i] = new Walker(new PVector (-500, 200), mass);
    walkers[i].setRandomColor();
  }
}

void draw()
{
  background(100);
  
  renderWalkers();
}

void renderWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].render();
    
    walkers[i].update();
    walkers[i].applyForce(wind);
    walkers[i].applyForce(gravity);
  }
}
