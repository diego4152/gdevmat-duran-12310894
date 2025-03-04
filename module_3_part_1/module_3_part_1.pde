void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker();

void draw()
{
  // flush the screen with white bg
  background(255);
  
  // render the CIRCLE
  myWalker.moveAndBounce();
  myWalker.render();
}
