public class Walker
{
   public PVector position;
   public float scale = 50;
   public PVector speed = new PVector(5, 5);
   public PVector acceleration = new PVector();
   
   public float velocityLimit = 3;
   public float r = 255, g = 255, b = 255, a = 255;
   
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
     noStroke();
     fill(r,g,b,a);
     circle(position.x, position.y, scale); 
   }
   
   public void setColor(float r, float g, float b, float a)
   {
     this.r = r;
     this.g = g;
     this.b = b;
     this.a = a;
   }
   
   public void setRandomColor()
   {
     this.r = int(random(255));
     this.g = int(random(255));
     this.b = int(random(255));
   }
   
   public void setRandomScale()
   {
     this.scale = int(random(10,40));
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
   
   public void move(PVector direction)
   {
      
      this.speed.add(acceleration);
      this.speed.limit(velocityLimit);
      
      direction.normalize();
      this.speed.add(direction);
      this.position.add(speed);
   }
}
