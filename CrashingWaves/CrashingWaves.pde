private Player jugador;
private Enemy enemy;
private Stage spawn;
private Stage nivel;

public void setup() {
  size(700, 700);
  jugador =new Player();
  spawn = new Stage();
  enemy = new Enemy();
  nivel = new Night(); // de momento se ira cambiando dependiendo el tiempo del dia (la clase) que se desea ver.
}

public void draw() {
  background(0);
  nivel.display();
  frameRate(15);
  jugador.keyPressed();
  jugador.keyReleased();
  spawn.addEnemy(enemy);
  spawn.display();
  //print(enemy.getOption());
}
