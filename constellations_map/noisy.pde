void noisy(){
  pg.noStroke();
  //pg.stroke(0);
  pg.beginDraw();
  pg.beginShape(); 
 xoff += 0.05;
    pg.fill(167,245,val1%255);
    pg.vertex(xoff,val2%pg.width);
    pg.fill(240,val1,34,100);
    pg.vertex(width,val2%pg.width/3);
    
  
 
  yoff += 0.5;
  pg.fill(map(val1,0,50,0,255),134,val1%200);
  pg.vertex(width, height-val1);
  
 
 
  pg.fill(201,val2,34,val2%230);
  pg.vertex(0, val1);
  pg.endShape(CLOSE);

pg.endDraw();

}