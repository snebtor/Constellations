void noisy(){
  pg.noStroke();
  //pg.stroke(0);
  pg.beginDraw();
  pg.beginShape(); 
  pg.noStroke();
  //pg.stroke(0);
  //blendMode(DARKEST);
    xoff += 0.05;
    pg.fill(0,0,90);
    pg.vertex(xoff,val2%pg.width);
    pg.fill(240,val1,34);
    pg.vertex(width,val2%pg.width/3);
    
  
 
  yoff += 0.5;
  pg.fill(0,134,0);
  pg.vertex(width, height-val1);
  
  pg.fill(201,200,0,val1%255);
  pg.vertex(0, val1);
  pg.endShape(CLOSE);

pg.endDraw();

}