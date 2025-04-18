PImage fondo;
void setup(){ 
  size(800, 400);
  fondo = loadImage("molten.png");
}


void draw(){
 
  background (219, 152, 73);
   image(fondo, 0, 0, 400, 400);
   println(mouseX);
   println(mouseY); 
 
 stroke( 0 );
  strokeWeight( 7 );
  line( 400, 0, 400, 400 );
 
 fill(0,0,0);
 strokeWeight( 7 );

// Balon de Basquet 
  noStroke(); fill(164, 78, 51); circle(601, 204, 350);
//
  stroke(0,0,0);
  strokeWeight( 4 ); fill(226, 214, 164); ellipse(601, 204, 350, 310);
  strokeWeight( 4 ); fill(164, 78, 51); ellipse(601, 204, 335, 250 );
  strokeWeight( 5 ); bezier(428,210,460,225,743,225,775, 210);

// Molten Official
  textFont(createFont("Petale",70));
    textSize(80);
  fill(0);
    text("molten",480,175);
    textSize(20);
    text("OFFICIAL",555,205);
    text("GG7",580,351);


 }
