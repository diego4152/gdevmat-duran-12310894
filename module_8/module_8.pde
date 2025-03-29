Walker[] walkers = new Walker[10];

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280, 720, P3D);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].setRandomPos();
    walkers[i].setRandomMass(3, 12);
    walkers[i].setRandomColor();
  }
}

void draw()
{
  background(255);

  renderWalkers();
}

void renderWalkers()
{
  for (Walker w : walkers)
  {
    /*
    OK OK SO AT FIRST I DIDN'T GET IT BUT UPON EXECUTION, I SEE IT NOW!!!
    
    so each walker in walkers[] goes through walkers[], 
    and the walker applies gravitational attraction to every walker
    in walkers[] **except** itself
    
    since each walker goes througb this process, every walker is
    guaranteed to be gravitationally attracted to all the other walkers
    */
    for (Walker w2 : walkers)
    {
      if (w != w2)
      {
        w.applyForce(w2.calculateAttraction(w));
      }
    }
    
    w.render();
    w.update();
    
    //w.checkEdges(); // this could have some funny results
  }
}
