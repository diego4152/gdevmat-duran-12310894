Walker[] walkers = new Walker[8];

PVector acceleration = new PVector(0.2, 0);

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);

  for (int i = 0; i < walkers.length; i++)
  {
    float mass = i + 2;
    int posY = 2 * (Window.windowHeight / walkers.length) * (i - (walkers.length / 2));
  
    walkers[i] = new Walker(new PVector(-500, posY), mass);
    walkers[i].setRandomColor();
  }
}

void draw()
{
  background(255);

  drawMiddle();
  renderWalkers();
}

void drawMiddle()
{
  strokeWeight(2);
  color black = color(0, 0, 0);
  fill(black);
  stroke(black);
  line(0, -300, 0, 300);
}

void renderWalkers()
{
  for (Walker w : walkers)
  {
    float mew = 0;
    if (w.position.x < 0)
    {
      mew = 0.01f;
    } else if (w.position.x > 0)
    {
      mew = 0.4f;
    }

    float normal = 1;
    float frictionMagnitude = mew * normal;

    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);

    w.render();

    w.update();
    w.applyForce(acceleration);
    w.applyForce(friction);
  }
}

void mouseClicked()
{
  setup();
}
