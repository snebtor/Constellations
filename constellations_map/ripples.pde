void ripples(){
  pg.beginDraw();
  pg.stroke(0);
  pg.strokeWeight(2);
 pg.pushMatrix();
  pg.translate(0,frameCount%120);
  for (int i=-168; i<=pg.width+160; i+=30){
  pg.pushMatrix();
  pg.beginShape();
  pg.scale(0.8);
  pg.translate(4,i);
   pg.vertex(A.x,A.y);
   pg.vertex(B.x,B.y);
    pg.vertex(C.x,C.y);
    pg.vertex(D.x,D.y);
    pg.vertex(E.x,E.y);
    pg.vertex(F.x,F.y);
  pg.endShape();
  pg.popMatrix();
  }
  pg.popMatrix();
}