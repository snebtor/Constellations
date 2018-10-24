void circle(){
  pg.beginDraw();
   
  
  //1280 x 800
//stroke(255);

for (int i = 0; i <= pg.height; i++) {
      float n = map(i,0,pg.height,0,val3);
      color c = lerpColor(tejas, akasa, n);
      pg.stroke(c);
       pg.line(0, i, pg.width,i);
    }
for (int i = 0; i <= pg.width; i++) {
      float n = map(i,0,pg.width,0,val3);
      color c = lerpColor(tejas, akasa, n);
      pg.stroke(c);
      pg.line(i, 20, i,120);
    }
    
for (int i = 0; i <= pg.width; i++) {
      float n = map(i,0,pg.width,0,sec);
      color c = lerpColor(akasa, tejas, n);
       pg.stroke(c,210);
       pg.line(i, 220, i,320);
    }
    pg.noStroke();
     pg.fill(tejas);
     
     pg.ellipse(pg.width/2,pg.height/2,20,20);
  pg.endDraw();
}