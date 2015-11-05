Snowflake[] blah;
int a = 100;

void setup()
{
  size(500,500);
  background(0);
  blah = new Snowflake[a];
  for (int i = 0; i < a; i ++)
  {
    blah[i]= new Snowflake();
  }
}

void draw()
{
  for (int i = 0; i < a; i ++)
  {
    blah[i].erase();
    blah[i].lookDown();
    blah[i].move();
    blah[i].wrap();
    blah[i].show();
  }
}

void mouseDragged()
{
  fill(0,(int)(Math.random()*256),(int)(Math.random()*200),250);
  ellipse(mouseX, mouseY, 10,10);
  fill(0,0,0);
  ellipse(mouseX+10,mouseY+10,10,10);
}

class Snowflake
{
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*500);
    y = 0;
    isMoving = true;
  }
  void show()
  {
    noStroke();
    fill(240, 255, 255);
    ellipse(x, y, 5, 5);
  }
  void lookDown()
  {
    if(y>0 && y<498 && (get(x,y+3)!= color(0))) {isMoving = false;}
    //the next spot the snow flake will get to, pass the erase circle,
    //is black ->keep moving, or not -> stop
      else {isMoving = true;}
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, 7, 7);
  }
  void move()
  {
    if(isMoving == true)
      y++;
  }
  void wrap()
  {
    if (y>500) {y = 0;}
  }
}
