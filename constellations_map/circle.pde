void circle(){
  pg.beginDraw();
  pg.noStroke();
  
  pg.fill(frameCount%255,val1, val2,167);
  pg.ellipse(pg.width/2, pg.height/2, val2, val2);
  pg.endDraw();
}