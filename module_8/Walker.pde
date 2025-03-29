public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float scale;
  public float velocityLimit = 10;

  public float r, g, b;
  public float a = 120;

  public float mass;

  public float gravitationalConstant = 1;
  
  public Walker()
  {
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

  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position); // get le direction

    float distance = force.mag();
    force.normalize();
    
    distance = constrain(distance, 5, 25);

    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);

    return force;
  }

  public void checkEdges()
  {
    if ((position.x >= Window.right) || (position.x <= Window.left))
    {
      velocity.x *= -1;
    }
    if ((position.y >= Window.top) ||  (position.y <= Window.bottom))
    {
      velocity.y *= -1;
    }
  }

  public void setRandomPos()
  {
    this.position.x = int(random(Window.left, Window.right));
    this.position.y = int(random(Window.bottom, Window.top));
  }
  
  public void setRandomMass(int min, int max)
  {
    this.mass = int(random(min, max));
    this.scale = this.mass * 10;
  }

  public void setRandomColor()
  {
    this.r = int(random(255));
    this.g = int(random(255));
    this.b = int(random(255));
  }
}
