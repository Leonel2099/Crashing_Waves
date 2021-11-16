/**
 Representa la clase Stage en la que se obtiene los distintos escenearios
 (dependindo de cada escenario se generan distintos enemigos)
 */
class Stage extends FrameObject {

  /**Representa el nivel en el que esta */
  protected Integer level;

  /** Representa la lista de enemigos */
  protected ArrayList <Enemy> enemies;

  /** Representa el puntaje */
  protected Integer score;

  /** Constructor por defecto */
  public Stage() {
    enemies = new ArrayList<Enemy>();
    this.score=0;
    this.level=ConstantList.FIRST_LEVEL;
  }
  
  //---Zona de metodos-------//
  
  /**Dibuja el escenario de juego segun el puntaje */
  public void display() {
    if (score<120){
      frameRate(20);
      Stage afternoon=new Morning();
      afternoon.display();
    } else if (this.score>=120&&score<440) {
      frameRate(40);
      this.level=ConstantList.SECOND_LEVEL;
      Stage afternoon=new Afternoon();
      afternoon.display();
    } else if (this.score>=440) {
      frameRate(80);
      this.level=ConstantList.THIRD_LEVEL;
      Stage afternoon=new Night();
      afternoon.display();
    }
  }
  
  /**Agrega enemigos diferentes dependiendo el escenario */
  public void addEnemy() {
    if (level==ConstantList.FIRST_LEVEL) {
      Enemy goblin1=new Goblin(new PVector(326, -48), ConstantList.DOWN_DIRECTION);
      Enemy goblin2=new Goblin(new PVector(-48, 326), ConstantList.RIGHT_DIRECTION);
      Enemy goblin3=new Goblin(new PVector(width+48, 326), ConstantList.LEFT_DIRECTION);
      Enemy goblin4=new Goblin(new PVector(326, height+48), ConstantList.UP_DIRECTION);
      this.enemies.add(goblin4);
      this.enemies.add(goblin3);
      this.enemies.add(goblin2);
      this.enemies.add(goblin1);
    } else if (level==ConstantList.SECOND_LEVEL) {
      Enemy possedEnemy1=new PossessedEnemy(new PVector(326, -48), ConstantList.DOWN_DIRECTION);
      Enemy possedEnemy2=new PossessedEnemy(new PVector(-48, 326), ConstantList.RIGHT_DIRECTION);
      Enemy possedEnemy3=new PossessedEnemy(new PVector(width+48, 326), ConstantList.LEFT_DIRECTION);
      Enemy possedEnemy4=new PossessedEnemy(new PVector(326, height+48), ConstantList.UP_DIRECTION);
      this.enemies.add(possedEnemy1);
      this.enemies.add(possedEnemy2);
      this.enemies.add(possedEnemy3);
      this.enemies.add(possedEnemy4);
    } else if (level==ConstantList.THIRD_LEVEL) {
      Enemy skelton1=new Skeleton(new PVector(326, -48), ConstantList.DOWN_DIRECTION);
      Enemy skelton2=new Skeleton(new PVector(-48, 326), ConstantList.RIGHT_DIRECTION);
      Enemy skelton3=new Skeleton(new PVector(width+48, 326), ConstantList.LEFT_DIRECTION);
      Enemy skelton4=new Skeleton(new PVector(326, height+48), ConstantList.UP_DIRECTION);
      this.enemies.add(skelton1);
      this.enemies.add(skelton2);
      this.enemies.add(skelton3);
      this.enemies.add(skelton4);
    }
  }
  
  /**Dibuja la lista de enemigos */
  public void displayEnemies() {
    for (Enemy enemy : enemies) {
      enemy.display();
    }
  }
  
  /**Realiza el movimiento de la lista de enemigos */
  public void moveEnemies() {
    for (Enemy enemy : enemies) {
      enemy.moveToCenter();
    }
  }

  /**Muestra el ataque de la lista de enemigos */
  public void showAttack(Player player) {
    for (Enemy enemy : enemies) {
      enemy.displayAttackToPlayer(player);
      if (enemy.attackToPlayer(player)) {
        player.displayPlayerHurt();
        player.lostLife();
      }
    }
  }
  
  /**Muestra la muerte de cada enemigo */
  public void displayDie() {
    Enemy enemy=new Goblin(new PVector(326,280),1);
    enemy.die();
  }
  
  /**Remueve un enemigo de la lista */
  public void removeEnemy(Player player) {
    for (int i =stage.enemies.size()-1; i>=0; i--) {
      if (player.colliding(enemies.get(i))) {
        enemies.remove(i);
        increaseScore();
      }
    }
  }
  
  /**Remueve la lista de enemigos pasando de nivel */
  public void removeSpawn(){
    for (int i =stage.enemies.size()-1; i>=0; i--) {
      enemies.remove(i);
    }
      
  }

  /**Agrega un enemigo en una direccion aleatorio */
  public void addEnemyRandom(){
    int num = (int)random(0, 4);
    if (level==ConstantList.FIRST_LEVEL) {
      switch(num){
        case 0:{
          Enemy goblin1=new Goblin(new PVector(326, -48), ConstantList.DOWN_DIRECTION);
          this.enemies.add(goblin1);
          break;
        } 
        case 1:{
          Enemy goblin2=new Goblin(new PVector(-48, 326), ConstantList.RIGHT_DIRECTION);
          this.enemies.add(goblin2);
          break;
        }
        case 2:{
          Enemy goblin3=new Goblin(new PVector(width+48, 326), ConstantList.LEFT_DIRECTION);
          this.enemies.add(goblin3);
          break;
        }
        case 3:{
          Enemy goblin4=new Goblin(new PVector(326, height+48), ConstantList.UP_DIRECTION);
          this.enemies.add(goblin4);
          break;
        }
      }
    }if (level==ConstantList.SECOND_LEVEL) {
      switch(num){
        case 0:{
          Enemy Possessed1=new PossessedEnemy(new PVector(326, -48), ConstantList.DOWN_DIRECTION);
          this.enemies.add(Possessed1);
          break;
        } 
        case 1:{
          Enemy Possessed2=new PossessedEnemy(new PVector(-48, 326), ConstantList.RIGHT_DIRECTION);
          this.enemies.add(Possessed2);
          break;
        }
        case 2:{
          Enemy Possessed3=new PossessedEnemy(new PVector(width+48, 326), ConstantList.LEFT_DIRECTION);
          this.enemies.add(Possessed3);
          break;
        }
        case 3:{
          Enemy Possessed4=new PossessedEnemy(new PVector(326, height+48), ConstantList.UP_DIRECTION);
          this.enemies.add(Possessed4);
          break;
        }
      }
    }if (level==ConstantList.THIRD_LEVEL) {
      switch(num){
        case 0:{
          Enemy Skeleton1=new Skeleton(new PVector(326, -48), ConstantList.DOWN_DIRECTION);
          this.enemies.add(Skeleton1);
          break;
        } 
        case 1:{
          Enemy Skeleton2=new Skeleton(new PVector(-48, 326), ConstantList.RIGHT_DIRECTION);
          this.enemies.add(Skeleton2);
          break;
        }
        case 2:{
          Enemy Skeleton3=new Skeleton(new PVector(width+48, 326), ConstantList.LEFT_DIRECTION);
          this.enemies.add(Skeleton3);
          break;
        }
        case 3:{
          Enemy Skeleton4=new Skeleton(new PVector(326, height+48), ConstantList.UP_DIRECTION);
          this.enemies.add(Skeleton4);
          break;
        }
      }
    }
  }
  
  /**Muestra el puntaje */
  public void showScore() {
    PFont Score;
    String points="0000";
    points=""+nf(score, 4);
    textAlign(CENTER);
    Score=createFont("alagard.ttf", 25);
    textFont(Score);
    text("Point", 600, 40);
    text(points, 600, 60);
  }

  /**Muestra el fondo para la pantalla de inicio */
  public void showStart() {
    PImage wallpaper=loadImage("data/Image/Fondo.png");
    image(wallpaper, 0, 0);
  }
  
  /**Muestra una pantalla de que el nivel se ha completado */
  public void showLevelPassScreen() {
    background(0);//Fondo de negro
    textAlign(CENTER);
    textSize(50);
    text("Press <n> para continuar.....", width/2, height/2);
  }

  /**Incrementa el puntaje segun el nivel */
  public void increaseScore() {
    if (level==ConstantList.FIRST_LEVEL) {
      this.score+=10;
    }
    if (level==ConstantList.SECOND_LEVEL) {
      this.score+=20;
    }
    if (level==ConstantList.THIRD_LEVEL) {
      this.score+=30;
    }
  }
  
  /**Muestra el numero del nivel */
  public void showLevel() {
    PFont levelt;
    levelt=createFont("alagard.ttf", 15);
    textAlign(CENTER);
    textFont(levelt);
    if (level==ConstantList.FIRST_LEVEL) {
      fill(0);
      text("1", 17, 54);
      fill(#E86D0E);
      text("1", 15, 53);
    }
    if (level==ConstantList.SECOND_LEVEL) {
      fill(0);
      text("2", 17, 54);
      fill(#E86D0E);
      text("2", 15, 53);
    }
    if (level==ConstantList.THIRD_LEVEL) {
      fill(0);
      text("3",17, 54);
      fill(255,255,255);
      text("3", 15, 53);
    }
  }

  //---Zona de metodos Accesores-------//
  
  /** Modifica el valor del atributo score */
  public void setScore(Integer score) {
    this.score=score;
  }
  /** Obtenemos la variable score */
  public Integer getScore() {
    return this.score;
  }

  /** Modifica el valor del atributo level */
  public void setLevel(Integer level) {
    this.level=level;
  }
  /** Obtenemos la variable level */
  public Integer getLevel() {
    return this.level;
  }
  /** Modifica el valor del atributo enemies */
  public void setEnemies (ArrayList enemies) {
    this.enemies = enemies;
  }
  /** Obtenemos la variable enemies */
  public ArrayList getEnemies() {
    return this.enemies;
  }
}
