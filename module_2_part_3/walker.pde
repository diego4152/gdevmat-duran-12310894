class Walker
{
  public float x;
  public float y;
  public float tx = 0;
  public float ty = 10000;
  
  private float tScale = 0;
  
  private float tRed = 1000;
  private float tGreen = 500;
  private float tBlue = 800;
  
  void render()
  {
    // rgb perlin
    float r = map(noise(tRed), 0, 1, 0, 255);
    float g = map(noise(tGreen), 0, 1, 0, 255);
    float b = map(noise(tBlue), 0, 1, 0, 255);
    
    tRed += 0.1f;
    tGreen += 0.1f;
    tBlue += 0.1f;
    
    color walkerColor = color(r, g, b);
    
    // scale perlin
    float scale = map(noise(tScale), 0, 1, 5, 150);
    tScale += 0.01f;
    
    // le circle
    fill(walkerColor);
    noStroke();
    circle(x, y, scale);
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
  }
}
