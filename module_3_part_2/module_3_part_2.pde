void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

PVector mousePos()
{
  // ok so i followed the video, right?
  // for some reason dividing windowWidth and windowHeight by 2 messed up the line and positioning and i do NOT know why
  // i thought i'd gotten some syntax wrong but then my code followed the vidoe to a t so i rlly don't know what happened
  // forgive me for this compromise
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  
  return new PVector(x, y);
}

void draw()
{
  background(130);
  
  drawLightsaber();
}

void drawLightsaber()
{
  PVector mouse = mousePos();
  
  // outer glow
  strokeWeight(40);
  stroke(255, 0, 0, 50);
  
  mouse.normalize().mult(500);
  line(0, 0, mouse.x, mouse.y);
  println(mouse.mag());
  
  line(0, 0, -mouse.x, -mouse.y);
  
  // inner glow
  strokeWeight(10);
  stroke(255, 200, 200);
  
  mouse.normalize().mult(490);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  // handle
  strokeWeight(20);
  stroke(0, 0, 0);
  
  mouse.normalize().mult(40);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
}
