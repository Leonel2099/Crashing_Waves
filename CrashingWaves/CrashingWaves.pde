/**Definicion de objetos*/
private Player player; //Personaje del juego
private Stage stage;//Gestiona spawn de enemigos , puntaje del jugador y cambio de nivles
private Player barlife;//Barra de vida del jugador
private int state;//Estado del juego

/**Void Setup donde instancio mis objetos*/
public void setup() {
  size(700, 700); //Tamaño del lienzo
  player =new Player();//Se instancia el objeto player de la clase Player
  barlife=new Player();//Se instancia el objeto barlife de la clase Player, representa la vida del jugador
  stage = new Stage();//Se instancia el objeto stage de la clase Stage
  stage.addEnemy();//Metodo de stage , añado enemigos a las lista
  state=ConstantList.START_GAME;//Se inicia el juego con estado en 0
}
/**Mencionamos a los metodos*/
public void draw() {
  switch (state) {//Segun el estado el juego toma distintos casos
  case ConstantList.START_GAME:
    stage.showStart();//Muestra un fondo de incio
    keyTyped();//Evaluamos la tecla presionada y ejecutamos la operacion
    break;
  case ConstantList.PLAYING:
    if (stage.enemies.size()<4) {
      stage.addEnemyRandom();//Cuando el tamaño de la lista sea menor a 4 agrega enemigos random
    }
    stage.display();//Dibuja el Fondo dependiendo el nivel y el puntaje
    player.keyTyped();//Evaluamos la tecla presionada y ejecutamos la operacion
    player.keyReleased();//Detecta si una tecla es presionada o no
    barlife.displayLifeBar(player.getLife());//Dibuja la barra de vida del jugador
    stage.showScore();//Muestra el puntaje del jugador
    stage.showLevel();//Muestra en que nivel se enscuentra
    stage.displayEnemies();//Dibuja a los enemigos que estan en una lista
    stage.moveEnemies();//Mueve a los enemigos que estan en la lista
    stage.showAttack(player);//Muestra el sprite de ataque de los enemigos en la lista
    stage.removeEnemy(player);//Remueve a los enemigos y muestra su sprite de muerte
    changeLevel();//Cambio de nivel
    losing(player.getLife());//Juego terminado
    break;
  case ConstantList.NEXT_SECOND_LEVEL:
    stage.showLevelPassScreen();//Muestra un fondo de siguiente nivel
    keyTyped();////Evaluamos la tecla presionada y ejecutamos la operacion
    break;
  case ConstantList.NEXT_THIRD_LEVEL:
    stage.showLevelPassScreen();//Muestra un fondo de siguiente nivel
    keyTyped();////Evaluamos la tecla presionada y ejecutamos la operacion
    break;
  case ConstantList.GAME_OVER:
    background(0);//Fonde de negro
    textAlign(CENTER);
    textSize(50);
    text("Press <r> para reiniciar \n o \n <Esc> para salir", width/2, height/2);
    break;
  }
}
//**Comprueba si la vida es igual a 0 o inferios y da el juego por finalizado*/
public void losing(int life) {
  if (life<=0) {
    state=ConstantList.GAME_OVER;//Estado=4
  }
}
//**Comprueba el puntaje del jugador para pasar de nivel*/
public void changeLevel() {
  if (stage.getScore()==120 && stage.getLevel()==ConstantList.FIRST_LEVEL) {
    stage.removeSpawn();//Remueve a los enemigos que quedan en la lista al finalizar el nivel
    state=ConstantList.NEXT_SECOND_LEVEL;//estado=2
  }
  if (stage.getScore()==440 && stage.getLevel()==ConstantList.SECOND_LEVEL) {
    stage.removeSpawn();//Remueve a los enemigos que quedan en la lista al finalizar el nivel
    state=ConstantList.NEXT_THIRD_LEVEL;//estado=3
  }
}
/** Evaluamos la tecla presionada y ejecutar una accion */
public void keyTyped(){
  if (key=='r') {//Reinicio de nivel
    stage.removeSpawn();//Remueve a los enemigos que quedan en la lista al finalizar el nivel
    stage.setLevel(ConstantList.FIRST_LEVEL);//Reinicio a nivel 1
    stage.setScore(0);//Reinicio el puntaje
    player.setLife(100);//Reincio la vida
    barlife.displayLifeBar(player.getLife());//Reinicio el sprite de vida
    state=ConstantList.START_GAME;//Muestro la pantalla de incio nuevamente
  }
  if (key=='n'&& stage.getScore()>=120) {
    state=ConstantList.PLAYING;//Estado=2
  }
  if (keyCode==ENTER) {
    state=ConstantList.PLAYING;//Estado=1
  }
}
