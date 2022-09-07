PGraphics PG;
PGraphics []pg_list = new PGraphics[9];

int i;
int which;
int index;
int num =120;
int number =0;
int pagenum =1;

int [] x = new int[num];
int [] y = new int[num];


float ix;
float iy;
float weight;
float angle =0;
float anglePageFive =0.0;

float my [] = new float [num];
float mx [] = new float [num];


//____________________________________||

void setup()
{
  fullScreen();
  background(255);
  for (i =0; i<pg_list.length; i++)
  {
    PGraphics pg = createGraphics(width, height);
    pg_list[i] =pg;
  }
}

//____________________________________||

void draw()
{
  // This Pagnum system allows me to have more the one draw pag||

  if (pagenum ==1)
  {
    PageOne(pg_list[0]);
  }
  if (pagenum ==2)
  {
    PageTwo(pg_list[1]);
  }
  if (pagenum ==3)
  {
    PageThree(pg_list[2]);
  }
  if (pagenum ==4)
  {
    PageFour(pg_list[3]);
  }
  if (pagenum ==5)
  {
    PageFive(pg_list[4]);
  }
  if (pagenum == 6)
  {
    PageSix(pg_list[5]);
  }
}

//____________________________________||

void PageOne(PGraphics pg)
{
  //On this page there is a simple white background||

  pg.beginDraw();
  pg.background(255);

  // this if statment allows me to clear the backgroung with a space bar||

  if (key ==' ')
  {
    pg.background(255);
  }

  pg.endDraw();
  image(pg, 0, 0);
}

//____________________________________||

void PageTwo(PGraphics pg)
{
  //On this Page there is two shape that rotate around another||
  // i was struggling to find a way that would allow me to clear the motion at any time i wanted||
  // i later found a solution, when the space bar is pressed there is a white background that is placed on top of the screen which gives the illusion that the page is clear||

  pg.beginDraw();
  pg.translate(mouseX, mouseY);
  pg.rotate(angle);

  angle += 0.2;
  pg.fill(random(255), random(255), random(255));
  pg.quad(18, 1, 21, 1, 21, 36, 14, 36);

  pg.fill(random(255), random(255), random(255));
  pg.ellipse(-15, -15, -30, 30);

  if (key ==' ')
  {
    pg.background(255);
  }

  pg.endDraw();
  image(pg, 0, 0);
}

//____________________________________||

void PageThree(PGraphics pg)
{
  //This page has a circle that follows the mouse||

  pg.beginDraw();
  weight =dist(mouseX, mouseY, pmouseX, pmouseY);
  pg.stroke(random(125, 255), random(125, 255), random(125, 255));
  pg.strokeWeight(weight/3);
  pg.fill(random(255), random(255), random(255));
  pg.ellipse(mouseX, mouseY, 20, 20);

  if (key ==' ')
  {
    pg.background(255);
  }

  pg.endDraw();
  image(pg, 0, 0);
}

//____________________________________||

void PageFour(PGraphics pg)
{
  //this Page has a line that follows the mouse||

  pg.beginDraw();
  weight =dist(mouseX, mouseY, pmouseX, pmouseY);
  pg.strokeWeight(weight);
  pg.stroke(random(255), random(255), random(255));
  pg.line(mouseX, mouseY, pmouseX, pmouseY);

  if (key ==' ')
  {
    pg.background(255);
  }

  pg.endDraw();
  image(pg, 0, 0);
}

//____________________________________||

void PageFive(PGraphics pg)
{
  // On this page i have many shapes that follow the mouse ...
  // and they do not leave any marks on the page|| 

  pg.beginDraw();

  // need to be fixed||

  pg.background(255);
  which =frameCount%num;

  mx [which] = mouseX;
  my [which] = mouseY;

  for (int i =0; i < num; i++) 
  {
    pg.fill(random(255), random(255), random(255), random(255));
    index = i;
    pg.ellipse(mx[index], my[index], i/2, i/2);
    index =(which + 13 + i) % num;
    pg.pushMatrix();
    pg.translate(mx[index], my[index]);
    pg.translate(130, 120);
    anglePageFive -=0.4;
    pg.rotate(anglePageFive);
    //scale(0.5);
    pg.rect(0, 0, 55, 55, 7);
    pg.popMatrix();
  }

  if (key ==' ')
  {
    pg.background(255);
  }

  pg.endDraw();
  image(pg, 0, 0);
}

//____________________________________||

void PageSix(PGraphics pg)
{
  //On this page there are two shape one that follows the mouse ...
  // the other shape that goes in the opposite direction of the mouse||
  // These motion was broken so i used the PGraphics and beginDraw which allowed it is work || 

  pg.beginDraw();
  pg.fill(random(255), random(255), random(255), 140);
  pg.pushMatrix();
  pg.translate(mouseX, mouseY);
  pg.rotate(angle);
  angle += 0.4;
  pg.ellipse(33, 22, 20, 20);
  pg.popMatrix();

  ix = width - mouseX;
  iy = height - mouseY;
  pg.fill(random(155, 255), random(0, 155), random(0, 200), random(0, 240));
  pg.ellipse(ix, iy, 40, 40);

  if (key ==' ')
  {
    pg.background(255);
  }

  pg.endDraw();
  image(pg, 0, 0);
}

//____________________________________||

void keyPressed()
{
  // This this system lets me change between pages||

  if (key =='1')
  {
    pagenum =1;
  }
  if (key =='2')
  {
    pagenum =2;
  }
  if (key == '3')
  {
    pagenum =3;
  }
  if (key == '4')
  {
    pagenum =4;
  } 
  if (key =='5')
  {
    pagenum =5;
  }
  if (key =='6')
  {
    pagenum =6;
  }

  //_____________________________||

  if (key =='s')
  {
    save("image1_" +number+"jpg");
    number++;
  }

  if (key =='d')
  {
    delay (5000);
  }

  // i tried to use this methods to clear the page but i was unable to make it work|| 
  //if (key ==' ')
  //{
  //  background(255);
  //}

  if (key =='q')
  {
    exit();
  }
}
