class Walker
{
  float x;
  float y;
  int movementSpeed = 10;
  
  void render()
  {
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    
    int a = int(random(50, 100));
    
    color walkerColor = color(r, g, b, a);
    
    fill(walkerColor);
    stroke(walkerColor);
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      // north
      y += movementSpeed;
    }
    else if (rng == 1)
    {
      // south
      y -= movementSpeed;
    }
    else if (rng == 2)
    {
      // east
      x += movementSpeed;
    }
    else if (rng == 3)
    {
      // west
      x -= movementSpeed;
    }
    else if (rng == 4)
    {
      // northeast
      y += movementSpeed;
      x += movementSpeed;
    }
    else if (rng == 5)
    {
      // northwest
      y += movementSpeed;
      x -= movementSpeed;
    }
    else if (rng == 6)
    {
      // southeast
      y -= movementSpeed;
      x += movementSpeed;
    }
    else if (rng == 7)
    {
      // southwest
      y -= movementSpeed;
      x -= movementSpeed;
    }
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(9));
    
    if (rng == 0 || rng == 1)
    {
      // north
      y += movementSpeed;
    }
    else if (rng == 2)
    {
      // south
      y -= movementSpeed;
    }
    else if (rng == 3)
    {
      // east
      x += movementSpeed;
    }
    else if (rng == 4)
    {
      // west
      x -= movementSpeed;
    }
    else if (rng == 5)
    {
      // northeast
      y += movementSpeed;
      x += movementSpeed;
    }
    else if (rng == 6)
    {
      // northwest
      y += movementSpeed;
      x -= movementSpeed;
    }
    else if (rng == 7)
    {
      // southeast
      y -= movementSpeed;
      x += movementSpeed;
    }
    else if (rng == 9)
    {
      // southwest
      y -= movementSpeed;
      x -= movementSpeed;
    }
  }
}
