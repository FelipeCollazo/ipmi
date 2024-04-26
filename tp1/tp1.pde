PImage fondo;
void setup(){
 size (800,400);
 fondo = loadImage("pajarocarpintero.jpeg");
}

void draw(){
 background(100,150,120);
 image(fondo, 0, 0, 400, 400);
 println(mouseX);
 println(mouseY); 


fill(0,0,0);

line(473,100,414,88);
triangle(771, 330, 577, 305, 635, 180);

fill(270,0,0); rect(505,220,70,-80);

fill(0,0,0); ellipse(580, 230, 150, 150);

fill(270,0,0); rect(505, 140, 70, -50);

quad(506, 140, 505, 90, 470, 90, 470, 110);

fill(0,0,0); triangle(411, 88, 470, 110, 478, 90);

fill(270,0,0); quad(478, 90, 520, 55, 600, 40, 575, 90);

fill(0,0,0); ellipse(505, 90, 15, 15); 

quad(560,302,535,315,540,325,575,305);

quad(530,325,544,360,555,360,540,325);

quad(540,325,495,325,500,315,535,315);

fill(125,50,0); ellipse(516, 345, 40, 40);

}
