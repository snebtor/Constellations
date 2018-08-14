// thin snake
void fluid(){

  calcWave1();
  renderWave1();
  theta += 0.08;
}

void calcWave1() {

  // For every x value, calculate a y value with sine function
  float amplitude = 0.1;
  float frequency = 1.7;
  float u_time = millis();
  
  float x = 0;
  for (int i = 0; i < yvalues.length; i++) {
    float yv = 0.0;
   
   // Reference: The Book of shaders
    yv = sin(x*frequency)*amplitude;
    float t = 0.00003*(-u_time*230.0);
    yv = sin(x*frequency + t)*amplitude;
    yv += sin(x*frequency*1.72 + (t*1.121))*amplitude*1.3;
    yv += sin(x*frequency*2.221 + t*0.437)*amplitude*3.11;
    yv += sin(x*frequency*3.1122+ t*1.269)*amplitude*2.5;
    yv *= amplitude*val1*val4; 
    x+=dx;
    yvalues[i] = yv;
    x += (xspacing/yvalues.length); //spacing of shapes
  }
}

void renderWave1() {
  pg.pushMatrix();
  
  noStroke();
  float val=sin(theta); //0 to 6.
  float val1=map(val,-1,1,100,255);
  // 
  strokeCap(ROUND);
  strokeJoin(ROUND);
   pg.beginDraw();
   pg.translate(100,300);
    
   pg.rotate(angle*0.1);
   pg.translate(-pg.width,-pg.height/2);
   pg.scale(1.3);
  
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length-1; x++) {
    pg.stroke(x*1.5,x%255,89);
    pg.strokeWeight(15); 
    pg.line(x*xspacing, pg.height/3.5+yvalues[x], (x+1)*xspacing, pg.height/3.5+yvalues[x+1]);
   pg.strokeWeight(5);
    pg.stroke(x*4.5,x%255,val1);
    pg.line(x*xspacing, pg.height/8+yvalues[x], (x+1)*xspacing, pg.height/8+yvalues[x+1]); 
    
  }
  pg.popMatrix();
  
pg.endDraw();

}