void noisy(){
 
  //pg.stroke(0);
  pg.beginDraw();
   
  pg.beginShape(); 
  pg.noStroke();
  //pg.stroke(0);
  
    //xoff += 0.009;
    //yoff += 0.00005;
    pg.fill(apas);
    pg.vertex(xoff,val2%pg.width);
    
    pg.vertex(width,val2%pg.width/3);
 
  pg.vertex(width, height);
  pg.vertex(0, val3);
  pg.endShape(CLOSE);

pg.endDraw();

}