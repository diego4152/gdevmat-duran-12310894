class Walker
{
  // taken from module 2 part 1
  PVector position = new PVector();
  PVector speed = new PVector(5, 5);
  
  void render()
  { 
    fill(182, 52, 100);
    noStroke();
    circle(position.x, position.y, 50);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      // north
      position.y += speed.y;
    }
    else if (rng == 1)
    {
      // south
      position.y -= speed.x;
    }
    else if (rng == 2)
    {
      // east
      position.x += speed.x;
    }
    else if (rng == 3)
    {
      // west
      position.x -= speed.x;
    }
    else if (rng == 4)
    {
      // northeast
      position.add(speed);
    }
    else if (rng == 5)
    {
      // northwest
      position.y += speed.y;
      position.x -= speed.x;
    }
    else if (rng == 6)
    {
      // southeast
      position.y -= speed.y;
      position.x += speed.x;
    }
    else if (rng == 7)
    {
      // southwest
      position.sub(speed);
    }
  }
  
  void moveAndBounce()
  {
    // speed and moving :)
    position.add(speed);
  
    // dvd screensaver moment (change direction when hitting screen edge)
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
    }
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
    }
  }
}
