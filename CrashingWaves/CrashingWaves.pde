/**Librerias importadas y necesarias para la ejecucion*/
import ddf.minim.*;

/**Definicion de objetos*/

/*Creamos los objetos necesarios para el audio*/
private Minim minim;
private AudioPlayer sword;
private AudioPlayer sword2;
private AudioPlayer intro;
private AudioPlayer nextLevel;
private AudioPlayer firstLevel;
private AudioPlayer secondLevel;
private AudioPlayer thirdLevel;
private AudioPlayer gameOver;
private AudioPlayer victory;
/**Creamos los objetos del juego*/
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
  state=ConstantList.START_GAME;//Se inicia el juego con estado en 0
  minim=new Minim(this);
  /*Cargamos los sonidos*/
  intro=minim.loadFile("intro.mp3");
  nextLevel=minim.loadFile("nextLevel.mp3");
  firstLevel=minim.loadFile("firstLevel.mp3");
  secondLevel=minim.loadFile("secondLevel.mp3");
  thirdLevel=minim.loadFile("thirdLevel.mp3");
  gameOver=minim.loadFile("gameOver.mp3");
  victory=minim.loadFile("victory.mp3");
  sword=minim.loadFile("sword.mp3");
  sword2=minim.loadFile("sword2.mp3");
}
/**Mencionamos a los metodos*/
public void draw() {
  playSound();//Metodo para elegir sonido segun el estado
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
    loseGame(player.getLife());//Juego terminado
    break;
  case ConstantList.NEXT_SECOND_LEVEL:
    nextLevel.setGain(-20);//Baja el volumen al sonido
    nextLevel.play();//Reprodecue el sonido
    stage.showLevelPassScreen();//Muestra un fondo de siguiente nivel
    keyTyped();////Evaluamos la tecla presionada y ejecutamos la operacion
    break;
  case ConstantList.NEXT_THIRD_LEVEL:
    nextLevel.setGain(-20);//Baja el volumen al sonido
    nextLevel.play();//Reprodecue el sonido
    stage.showLevelPassScreen();//Muestra un fondo de siguiente nivel
    keyTyped();////Evaluamos la tecla presionada y ejecutamos la operacion
    break;
  case ConstantList.GAME_OVER:
    background(0);//Fonde de negro
    fill(#FF6803);
    textAlign(CENTER);
    textSize(60);
    text("GAME OVER", width/2, height/2-100);
    textSize(40);
    text("Press <r> para reiniciar \n o \n <Esc> para salir", width/2, height/2);
    break;
  case ConstantList.VICTORY:
    size(700,700);
    background(0);//Fonde de negro
    textAlign(CENTER);
    textSize(60);
    text("VICTORY", width/2, height/2-200);
    textSize(30);
    text("Press <r> para reiniciar \n o \n <Esc> para salir", width/2, height/2-100);
    textSize(20);
    text("Grupo 1: ", width/2, height/2+40);
    text("xBata", width/2, height/2+60);
    text("facudk", width/2, height/2+80);
    text("leo2099", width/2, height/2+100);
    text("ariel2021", width/2, height/2+120);
    break;
  }
}
/**Metodo para reproducir y pausar los sonidos*/
public void playSound(){
  if(state==ConstantList.START_GAME){
    intro.setGain(-20);//Baja el volumen al sonido
    intro.play();//Reprodecue el sonido
  }else {
    intro.pause();//Le pone pausa al sonido
    intro.rewind();//Rebobina el sonido
  }if (state==ConstantList.PLAYING && stage.getLevel()==ConstantList.FIRST_LEVEL){
    firstLevel.setGain(-20);
    firstLevel.play();
  }else{
    firstLevel.pause();
    firstLevel.rewind();
  }
  if(state==ConstantList.PLAYING && stage.getLevel()==ConstantList.SECOND_LEVEL){
    secondLevel.setGain(-20);
    secondLevel.play();
  }else{
    secondLevel.pause();
    secondLevel.rewind();
  }if(state==ConstantList.PLAYING && stage.getLevel()==ConstantList.THIRD_LEVEL){
    thirdLevel.setGain(-20);
    thirdLevel.play();
  }else{
    thirdLevel.pause();
    thirdLevel.rewind();
  }
  if(state==ConstantList.GAME_OVER){
    gameOver.setGain(-20);
    gameOver.play();
  }else{
    gameOver.pause();
    gameOver.rewind();
  }if(state==ConstantList.VICTORY){
    victory.setGain(-20);
    victory.play();
  }else{
    victory.pause();
    victory.rewind();
  }
}

//**Comprueba si la vida es igual a 0 o inferios y da el juego por finalizado*/
public void loseGame(int life) {
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
  }if(stage.getScore()==800){
    state=ConstantList.VICTORY;//estado=5
  }
}
/** Evaluamos la tecla presionada y ejecutar una accion */
public void keyTyped(){
  if (key=='r'&& state==ConstantList.GAME_OVER||key=='r'&& state==ConstantList.VICTORY) {//Reinicio de nivel
    stage.removeSpawn();//Remueve a los enemigos que quedan en la lista al finalizar el nivel
    stage.setLevel(ConstantList.FIRST_LEVEL);//Reinicio a nivel 1
    stage.setScore(0);//Reinicio el puntaje
    player.setLife(100);//Reincio la vida
    state=ConstantList.START_GAME;//Muestro la pantalla de incio nuevamente
  }
  if (key=='n'&& stage.getScore()>=120) {
    nextLevel.pause();
    nextLevel.rewind();
    state=ConstantList.PLAYING;//Estado=1
  }
  if (keyCode==ENTER) {
    state=ConstantList.PLAYING;//Estado=1
  }
}
