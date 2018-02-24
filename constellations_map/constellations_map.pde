PGraphics pg;

class Vertx {
 int x, y;
 Vertx(int xV, int yV) {
   x = xV;
   y = yV;
 }
} 

Vertx[]vertices;
Vertx vx1, vx2, vx3, vx4;
boolean firstpress, polygonClosed, editMode;
int x1, y1, x2, y2, a, verticesIndex;
float xoff, yoff,val1,val2;

int xspacing = 3;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave


float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

/////////////////////////////////////////////////////
float moveA; float moveB; float moveC; float moveD; 
float moveE; float moveF; float moveG; float moveH;    
float time_passed;
float fluid_anchor = 1.0;
float check = 0.0;
PVector A,B,C,D,E,F;


// Gets stuck if mouse clicks during "play" mode
// revise why the use of general mouse pressed vs. local to each mode
//possibility of saving points into a file with date

void setup() {
  A = new PVector(0, 44);
  B = new PVector(142, 44);
  C = new PVector(142, 0);
  D = new PVector(370, 0);
  E = new PVector(370, 44);
  F = new PVector(512, 44);
  frameRate(15);
  lights();
  //size(800, 600,P3D);
  fullScreen(P3D);
  pg = createGraphics(400, 200);
  textureMode(NORMAL);
  vertices = new Vertx[1];
    firstpress = editMode = true;
    polygonClosed = false;
    verticesIndex = 0;
    a = 0;
    smooth();
    background(0);
     w = 400+66; // connected to spacing of curved lines
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  ////////
  time_passed = 0;
}

void draw() {

   
   val1=int(random(0,height)); 
   val2=map(noise(xoff), 0, 1, 0,pg.height);
   //background
   pg.beginDraw();
   pg.noStroke();
   pg.fill(val1%255,65,98,156);
   pg.rect(0,0,pg.width,pg.height);
   pg.endDraw();
  
  
  //window that is mapped

  //mapped animation #1
  noisy();
  ripples();
  fluid();
  
  //paint the pg image
  image(pg, 10, 10); 
  text("EDITMODE: ON:", width-200,10);
  beginShape();
  texture(pg);
   vertex(476, 37,0,0);
    vertex(565,43,1,0);
    vertex(749,133,1,1);
    vertex(678,133,0,1);
   endShape(CLOSE);
  
  xoff += random(-0.5,0.5);
  
  //ADD GEOMETRY CREATION TOOL )No network
  if (!editMode) {
    background(0);
    for (int i=0; i<vertices.length; i=i+4) {
      
      noStroke();
      
        //shape 1
      beginShape();
      texture(pg);
      vertex(vertices[i].x, vertices[i].y, 0, 0); 
      vertex(vertices[i+1].x, vertices[i+1].y, 1, 0); 
      vertex(vertices[i+2].x, vertices[i+2].y, 1, 1); 
      vertex(vertices[i+3].x, vertices[i+3].y, 0, 1); 
      endShape(CLOSE);    
    } 
    //editMode = !editMode;
  }
  
  
  
}


void mousePressed() {
  
 
  if (firstpress == true && editMode == true){
    x1 = mouseX;
    y1 = mouseY;
    x2 = x1;
    y2 = y1;
    firstpress = false;
    //println("HEREEEE");
    //println(verticesIndex);
    vertices = (Vertx[]) expand(vertices, verticesIndex+1);
    vertices[verticesIndex] = new Vertx(x1, y1);   
  }else{
    x1 = x2;
    y1 = y2;
    x2 = mouseX;
    y2 = mouseY;

    //verticesIndex++;
    if (verticesIndex % 4 > 0 || polygonClosed == true) {
      vertices = (Vertx[]) expand(vertices, verticesIndex+1);
      vertices[verticesIndex] = new Vertx(x2, y2);
      polygonClosed = false;
    } else {
      polygonClosed = true;
      firstpress = true;
    }
  }
}

void mouseReleased(){
  if (verticesIndex % 4 == 0 && firstpress == true && editMode == true) {
    x2 = vertices[vertices.length-4].x;
    y2 = vertices[vertices.length-4].y;
    verticesIndex--;
    
  }
    verticesIndex++;
   // noStroke();
    stroke(225);
    //strokeWeight(1);
    line(x1, y1, x2, y2);
}

void keyPressed() {
  editMode = !editMode;
  
}