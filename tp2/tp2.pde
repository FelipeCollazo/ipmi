PImage[] img = new PImage[3];
PImage fondoI, fondoF;
String[] txt = new String[3];
PFont fuente;

int pantalla = 0;
int tiempo = 0;
int alphaText = 0;

void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);

  fondoI = loadImage("fondo_inicio.jpg");
  fondoF = loadImage("fondo_final.jpg");

  img[0] = loadImage("intro.jpg");
  img[1] = loadImage("requisitos.jpg");
  img[2] = loadImage("consejos.jpg");

  txt[0] = "Este es el modo Premier, donde jugás competitivo de verdad. Tus puntos, mapas y amigos conectados.";
  txt[1] = "Acá está el lobby antes de cada partida. Ves tu personaje, los puntos y el mapa que vas a jugar.";
  txt[2] = "Max, capitán de 9z, referente del CS2 competitivo. Estrategia y trabajo en equipo al máximo nivel.";

  fuente = loadFont("cs2font.vlw");
  textFont(fuente, 16);

  tiempo = millis();
}

void draw() {
  background(0);

  if (pantalla == 0) {
    image(fondoI, 0, 0, width, height);
    fill(0);
    textAlign(RIGHT, TOP);
    textSize(30);
    text("TP2 IPMI", width - 20, 20);
    textSize(14);
    text("Felipe Collazo", width - 20, 60);

    if (millis() - tiempo > 3000) {
      pantalla = 1;
      tiempo = millis();
      alphaText = 0;
    }
  }

  if (pantalla >= 1 && pantalla <= 3) {
    mostrarImagen(img[pantalla - 1]);
    mostrarTextoAnimado(txt[pantalla - 1]);

    if (millis() - tiempo > 5000) {
      pantalla++;
      tiempo = millis();
      alphaText = 0;
    }
  }

  if (pantalla == 4) {
    image(fondoF, 0, 0, width, height);
    fill(0);
    textAlign(RIGHT, TOP);
    textSize(40);
    text("Fin", width - 20, 20);
    textSize(16);
    text("Si querés, jugamos una juntos.", width - 20, 70);
    botonReiniciar("Reiniciar", width - 130, height - 50, 120, 40);
  }
}

void mostrarImagen(PImage i) {
  float ratioI = float(i.width) / i.height;
  float ratioPant = float(width) / height;

  if (ratioI > ratioPant) {
    float nuevoW = i.height * ratioPant;
    float corteX = (i.width - nuevoW) / 2;
    image(i.get(int(corteX), 0, int(nuevoW), i.height), 0, 0, width, height);
  } else {
    float nuevoH = i.width / ratioPant;
    float corteY = (i.height - nuevoH) / 2;
    image(i.get(0, int(corteY), i.width, int(nuevoH)), 0, 0, width, height);
  }
}

void mostrarTextoAnimado(String t) {
  fill(0, 200);
  rect(0, height - 80, width, 80);

  alphaText = constrain(alphaText + 5, 0, 255);

  fill(255, alphaText);
  textSize(16);
  textAlign(CENTER, CENTER);

  String[] partes = splitTokens(t, ".");

  if (partes.length >= 1) text(trim(partes[0]) + ".", width/2, height - 60);
  if (partes.length >= 2) text(trim(partes[1]), width/2, height - 35);
}

void botonReiniciar(String t, float x, float y, float w, float h) {
  fill(0);
  rect(x, y, w, h, 10);
  fill(255);
  textSize(16);
  textAlign(CENTER, CENTER);
  text(t, x + w/2, y + h/2);
}

void mousePressed() {
  if (pantalla == 4) {
    if (dentro(width - 130, height - 50, 120, 40)) {
      pantalla = 0;
      tiempo = millis();
      alphaText = 0;
    } else {
      textSize(int(random(20, 100)));
      fill(0);
      textAlign(LEFT, BASELINE);
      text("CS2", mouseX, mouseY);
    }
  }
}

boolean dentro(float x, float y, float w, float h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}
