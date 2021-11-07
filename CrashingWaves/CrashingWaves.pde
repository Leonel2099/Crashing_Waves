//**Definicion de Objetos*/
private Player jugador;//Personaje del Juego
private Enemy enemy;//Enemigos del Juego
private Stage spawn;//Lista de Enemigos
private Stage nivel;//Carga el escenario en background

public void setup() {
  size(700, 700);//Definimos el tamaño del lienzo
  jugador =new Player();//Se instancia un objeto jugador de la clase Player
  spawn = new Stage();//Se instancia un objeto spawn de la clase Stage
  enemy = new Enemy();//Se instancia un objeto enemy de la clase Enemy
  nivel = new Night(); // de momento se ira cambiando dependiendo el tiempo del dia (la clase) que se desea ver.
}

public void draw() {
  background(0);//Se establese un fondo negro 
  nivel.display();//Se cola una imagen de modo de Noche 
  frameRate(15);//Se define un freamrate para calibrar los movimientos de sprites
  jugador.keyPressed();//Metodo que evalua la tecla presionada para que el jugador haga una accion
  jugador.keyReleased();//Metodo que evalua cuando el jugador deja de presionar la tecla
  spawn.addEnemy(enemy.getOption());//Añadimos enemigos a las lista 
  spawn.display();//Dibujamos los enemigos que estan en la lista 
}
