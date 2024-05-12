float a; // Coeficiente cuadrático
float b; // Coeficiente lineal
float c; // Término independiente

color azul;
color amarillo;
color verde;
color rojo;
color rosado;

void setup() {
  size(400, 400);
  background(0);
  stroke(255);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  a=1;
  b=-3;
  c=2;
  azul = color(0, 0, 255);
  amarillo = color(255, 255, 0);
  verde = color(0, 255, 0);
  rojo = color(255, 0, 0);
  rosado = color(255, 0, 255);
  ponerTexto();
}

void draw(){
  dibujarFuncionCuadratica(a, b, c, azul); // Dibuja la funcion cuadratica
}

void dibujarFuncionCuadratica(float a, float b, float c, color col) {
  float scale = 0.1; // Escala para dibujar la función
  stroke(col);
  noFill();
  beginShape();
  for (float x = -width/2; x <= width/2; x += 1) {
    float y = a * x * x + b * x + c; // Calcular el valor de y para cada x
    vertex(x + width/2, -y * scale + height/2); // Dibujar el vértice
  }
  endShape();
}

void keyPressed() {
  // operaciones de la función cuadrática
  if (key == 't') { // Traslación
    aplicarTraslacion(50, 100, a, b, c,rojo ); // Trasladar 50 unidades en x y 100 unidades en y
  } else if (key == 'r') { // Reflexión
    aplicarReflexion(a, b, c,verde ); // Reflexión respecto al eje x
  } else if (key == 'a') { // Alargamiento
    aplicarAlargamiento(2, a, b, c, amarillo); // Alargar la función por un factor de 2
  } else if (key == 'c') { // Compresión
    aplicarCompresion(0.5, a, b, c,rosado ); // Comprimir la función por un factor de 0.5
  }
}

void aplicarTraslacion(float dx, float dy, float a, float b, float c, color col) {
  // Dibujar la función cuadrática trasladada
  dibujarFuncionCuadratica(a, b, c + dy - a * dx * dx - b * dx, col);
}

void aplicarReflexion(float a, float b, float c, color col) {
  // Dibujar la función cuadrática reflejada
  dibujarFuncionCuadratica(a, -b, c, col);
}

void aplicarAlargamiento(float factor, float a, float b, float c, color col) {
  // Dibujar la función cuadrática alargada
  dibujarFuncionCuadratica(a * factor, b * factor, c * factor * factor, col);
}

void aplicarCompresion(float factor, float a, float b, float c, color col) {
  // Dibujar la función cuadrática comprimida
  dibujarFuncionCuadratica(a / factor, b / factor, c / (factor * factor), col);
}

void ponerTexto(){
  fill(255);
  text("y", width/2-20, 20); 
  text("x",width-20,height/2-10);
  text("presionar t: translacion",20,height*.6);
  text("presionar r: reflexion",20,height*.7);
  text("presionar a: alargamiento",20,height*.8);
  text("presionar c: compresion",20,height*.9);
}
