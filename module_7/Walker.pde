public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float scale;
  public float velocityLimit = 10;

  public float r, g, b;
  public float a = 255;

  public float mass;

  Walker(PVector _position, float _mass)
  {
    this.position = _position;
    this.mass = _mass;

    this.scale = this.mass * 15;
  }

  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.velocityLimit);
    this.position.add(this.velocity);

    this.acceleration.mult(0);
  }

  public void render()
  {
    noStroke();
    fill(r, g, b, a);
    circle(position.x, position.y, scale);
  }

  public void checkEdges()
  {
    if ((position.x >= Window.right) || (position.x <= Window.left))
    {
      velocity.x *= -1;
    }
    if (position.y <= Window.bottom)
    {
      velocity.y *= -1;
      position.y = Window.bottom;
    }
  }

  public void setRandomColor()
  {
    this.r = int(random(255));
    this.g = int(random(255));
    this.b = int(random(255));
  }
}
