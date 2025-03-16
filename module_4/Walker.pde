public class Walker
{
   public PVector position;
   public float scale = 50;
   public PVector speed = new PVector(5, 5);
   public PVector acceleration = new PVector(-0.01, 0.1);
   
   public float velocityLimit = 10;
   
   public float r, g, b;
   public float a = 255;
   
   Walker()
   {
     position = new PVector(); 
   }
   
   Walker(PVector position)
   {
     this.position = position; 
   }
   
   public void render()
   {
     fill(r,g,b,a);
     circle(position.x, position.y, scale);
   }
   
   public void setRandomColor()
   {
     this.r = int(random(255));
     this.g = int(random(255));
     this.b = int(random(255));
   }
   
   public void setRandomScale()
   {
     this.scale = int(random(10,50));
   }
   
   public void setGaussPos()
   {
     // variables for position
     float xGaussian = randomGaussian();
     float xStandardDeviation = Window.widthPx / 4;
     float xMean = 0;
     
     float x = xStandardDeviation * xGaussian + xMean;
     
     float yGaussian = randomGaussian();
     float yStandardDeviation = Window.heightPx / 4;
     float yMean = 0;
     
     float y = yStandardDeviation * yGaussian + yMean;
     
     this.position = new PVector(x, y);
   }
   
   public void move(PVector target)
   {
      PVector direction = PVector.sub(target, this.position);
      direction.normalize();
      this.acceleration.add(direction);
      
      this.acceleration.mult(0.2);
      
      this.speed.add(acceleration);
      this.speed.limit(velocityLimit);
      
      this.position.add(speed);
   }
}
