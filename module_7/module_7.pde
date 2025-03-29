Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.1, 0);
//PVector gravity = new PVector(0.0, -0.1);

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280, 720, P3D);

  for (int i = 0; i < walkers.length; i++)
  {
    int mass = int(random(3, 11));
    int posX = 2 * (Window.windowWidth / walkers.length) * (i - (walkers.length / 2));

    walkers[i] = new Walker(new PVector(posX, 350), mass);
    walkers[i].setRandomColor();
  }
}

void draw()
{
  background(255);

  ocean.render();
  renderWalkers();
}

void renderWalkers()
{
  for (Walker w : walkers)
  {
    PVector gravity = new PVector(0, -0.15f * w.mass);

    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    
    w.render();

    w.update();
    w.applyForce(wind);
    w.applyForce(gravity);
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));

    w.checkEdges();
    
    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
  }
}
