/**
 Representa la clase Stage en la que se obtiene los distintos escenearios
 (dependindo de cada escenario se generan distintos enemigos)
 */
class Stage extends FrameObject {

  /**Representa la el nivel en el que esta */
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
    if (this.score<300) {
      Stage levelOne=new Morning();
      levelOne.display();
    } else if (this.score>=300&&this.score<660) {
      this.level=ConstantList.SECOND_LEVEL;
      Stage levelTwo=new Afternoon();
      levelTwo.display();
    } else if (this.score>=660) {
      this.level=ConstantList.THIRD_LEVEL;
      Stage levelThree=new Night();
      levelThree.display();
    }
  }

  /**Muestra el numero del nivel */
  public void showLevel() {
    PFont levelt;
    levelt=createFont("upheavtt.ttf", 20);
    textAlign(CENTER);
    textFont(levelt);
    if (level==ConstantList.FIRST_LEVEL) {
      fill(0);
      text("1", 21, 54);
      fill(#8B4D0A);
      text("1", 23, 54);
    }
    if (level==ConstantList.SECOND_LEVEL) {
      fill(0);
      text("2", 21, 54);
      fill(#8B4D0A);
      text("2", 23, 54);
    }
    if (level==ConstantList.THIRD_LEVEL) {
      fill(0);
      text("3", 21, 54);
      fill(#8B4D0A);
      text("3", 23, 54);
    }
  }

  /**Muestra el puntaje */
  public void showScore() {
    PFont Score;
    String points="0000";
    points=""+nf(score, 4);
    textAlign(CENTER);
    Score=createFont("alagard.ttf", 15);
    textFont(Score);
    text("Score", 615, 40);
    Score=createFont("alagard.ttf", 23);
    textFont(Score);
    text(points, 612, 60);
  }


  /**Muestra el fondo para la pantalla de inicio */
  public void showStart() {
    PImage wallpaper=loadImage("data/Image/Fondo.png");
    image(wallpaper, 0, 0);
  }

  /**Muestra el sprite del pergamino*/
  public void showParchment() {
    PImage score;
    if (level==ConstantList.FIRST_LEVEL) {
      score=loadImage("data/Image/parchment_goblin.png");
      image(score, 500, 20);
    }
    if (level==ConstantList.SECOND_LEVEL) {
      score=loadImage("data/Image/parchment_enemypossessed.png");
      image(score, 500, 20);
    }
    if (level==ConstantList.THIRD_LEVEL) {
      score=loadImage("data/Image/parchment_skeleton.png");
      image(score, 500, 20);
    }
  }

  /**Muestra una pantalla de transicion */
  public void showLevelPassScreen() {
    PFont passScreen;
    background(0);//Fondo de negro
    passScreen=createFont("alagard.ttf", 50);
    textFont(passScreen);
    textAlign(CENTER);
    text("Press <n> para continuar.....", width/2, height/2);
  }

  /** Añade un goblin a la lista con posicion y velocidad aleatoria*/
  public void addGoblinRandom() {
    int num = (int)random(0, 4);
    switch(num) {
    case 0:
      {
        Enemy goblin1=new Goblin(new PVector(random(295, 335), -48), ConstantList.DOWN_DIRECTION);
        goblin1.setVelocity(new PVector(random(4, 6), random(4, 6)));
        this.enemies.add(goblin1);
        break;
      }
    case 1:
      {
        Enemy goblin2=new Goblin(new PVector(-48, random(295, 335)), ConstantList.RIGHT_DIRECTION);
        goblin2.setVelocity(new PVector(random(4, 6), random(4, 6)));
        this.enemies.add(goblin2);
        break;
      }
    case 2:
      {
        Enemy goblin3=new Goblin(new PVector(width+48, random(295, 335)), ConstantList.LEFT_DIRECTION);
        goblin3.setVelocity(new PVector(random(4, 6), random(4, 6)));
        this.enemies.add(goblin3);
        break;
      }
    case 3:
      {
        Enemy goblin4=new Goblin(new PVector(random(295, 335), height+48), ConstantList.UP_DIRECTION);
        goblin4.setVelocity(new PVector(random(4, 6), random(4, 6)));
        this.enemies.add(goblin4);
        break;
      }
    }
  }
  
  /** Añade un possessedEnemy a la lista con posicion y velocidad aleatoria*/
  public void addPossessedRandom() {
    int num = (int)random(0, 4);
    switch(num) {
    case 0:
      {
        Enemy Possessed1=new PossessedEnemy(new PVector(random(285, 345), -48), ConstantList.DOWN_DIRECTION);
        Possessed1.setVelocity(new PVector(random(6, 8), random(6, 8)));
        this.enemies.add(Possessed1);
        break;
      }
    case 1:
      {
        Enemy Possessed2=new PossessedEnemy(new PVector(-48, random(285, 345)), ConstantList.RIGHT_DIRECTION);
        Possessed2.setVelocity(new PVector(random(6, 8), random(6, 8)));
        this.enemies.add(Possessed2);
        break;
      }
    case 2:
      {
        Enemy Possessed3=new PossessedEnemy(new PVector(width+48, random(285, 345)), ConstantList.LEFT_DIRECTION);
        Possessed3.setVelocity(new PVector(random(6, 8), random(6, 8)));
        this.enemies.add(Possessed3);
        break;
      }
    case 3:
      {
        Enemy Possessed4=new PossessedEnemy(new PVector(random(285, 345), height+48), ConstantList.UP_DIRECTION);
        Possessed4.setVelocity(new PVector(random(6, 8), random(6, 8)));
        this.enemies.add(Possessed4);
        break;
      }
    }
  }
  
  /** Añade un skeleton a la lista con posicion y velocidad aleatoria*/
  public void addSkeletonRandom() {
    int num = (int)random(0, 4);
    switch(num) {
    case 0:
      {
        Enemy Skeleton1=new Skeleton(new PVector(random(285, 345), -48), ConstantList.DOWN_DIRECTION);
        Skeleton1.setVelocity(new PVector(random(6, 10), random(6, 10)));
        this.enemies.add(Skeleton1);
        break;
      }
    case 1:
      {
        Enemy Skeleton2=new Skeleton(new PVector(-48, random(285, 345)), ConstantList.RIGHT_DIRECTION);
        Skeleton2.setVelocity(new PVector(random(6, 10), random(6, 10)));
        this.enemies.add(Skeleton2);
        break;
      }
    case 2:
      {
        Enemy Skeleton3=new Skeleton(new PVector(width+48, random(285, 345)), ConstantList.LEFT_DIRECTION);
        Skeleton3.setVelocity(new PVector(random(6, 10), random(6, 10)));
        this.enemies.add(Skeleton3);
        break;
      }
    case 3:
      {
        Enemy Skeleton4=new Skeleton(new PVector(random(285, 345), height+48), ConstantList.UP_DIRECTION);
        Skeleton4.setVelocity(new PVector(random(6, 10), random(6, 10)));
        this.enemies.add(Skeleton4);
        break;
      }
    }
  }

  /**Agrega distintos tipos de enemigos segun el nivel*/
  public void addEnemy() {
    if (level==ConstantList.FIRST_LEVEL) {
      addGoblinRandom();
    }
    if (level==ConstantList.SECOND_LEVEL) {
      addPossessedRandom();
      addGoblinRandom();
    }
    if (level==ConstantList.THIRD_LEVEL) {
      addSkeletonRandom();
      addPossessedRandom();
      addGoblinRandom();
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

  /**Remueve un enemigo de la lista */
  public void removeEnemy(Player player) {
    for (int i =stage.enemies.size()-1; i>=0; i--) {
      if ((player.colliding(enemies.get(i)))) {
        if (player.getDirection()==ConstantList.UP_DIRECTION_ATTACK&&enemies.get(i).getDirection()==ConstantList.DOWN_DIRECTION) {
          enemies.get(i).displayDie() ;
          enemies.remove(i);
          increaseScore();
        }
        if (player.getDirection()==ConstantList.LEFT_DIRECTION_ATTACK&&enemies.get(i).getDirection()==ConstantList.RIGHT_DIRECTION) {
          enemies.get(i).displayDie() ;
          enemies.remove(i);
          increaseScore();
        }
        if (player.getDirection()==ConstantList.DOWN_DIRECTION_ATTACK&&enemies.get(i).getDirection()==ConstantList.UP_DIRECTION) {
          enemies.get(i).displayDie() ;
          enemies.remove(i);
          increaseScore();
        }
        if (player.getDirection()==ConstantList.RIGHT_DIRECTION_ATTACK&&enemies.get(i).getDirection()==ConstantList.LEFT_DIRECTION) {
          enemies.get(i).displayDie() ;
          enemies.remove(i);
          increaseScore();
        }
        if (player.getDirection()==ConstantList.ALL_DIRECTION_ATTACK) {
          if (enemies.get(i).getDirection()==ConstantList.DOWN_DIRECTION||enemies.get(i).getDirection()==ConstantList.LEFT_DIRECTION||enemies.get(i).getDirection()==ConstantList.RIGHT_DIRECTION||enemies.get(i).getDirection()==ConstantList.UP_DIRECTION) {
            enemies.get(i).displayDie() ;
            enemies.remove(i);
            increaseScore();
            int charger=player.getCharger();
            player.setCharger(charger-1);
          }
        }
      }
      if (player.getCharger()==0||player.getCharger()<8) {
          player.resetCharger(this.level, this.score);
      }
    }
  }


  /**Remueve la lista de enemigos pasando de nivel */
  public void removeSpawn() {
    for (int i =stage.enemies.size(); i>0; i--) {
      enemies.remove(i-1);
    }
  }

  public void displayGameOver() {
    PFont gameOver;
    background(0);//Fondo de negro
    gameOver=createFont("alagard.ttf", 60);
    textFont(gameOver);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2-100);
    textSize(40);
    text("Press <r> para reiniciar \n o \n <Esc> para salir", width/2, height/2);
  }

  public void displayCredits() {
    PFont credits;
    background(0);//Fondo de negro
    credits=createFont("alagard.ttf", 60);
    textFont(credits);
    textAlign(CENTER);
    text("VICTORY", width/2, height/2-200);
    textSize(30);
    text("Press <r> para reiniciar \n o \n <Esc> para salir", width/2, height/2-100);
    textSize(20);
    text("Grupo 1: ", width/2, height/2+40);
    text("xBata", width/2, height/2+60);
    text("facudk", width/2, height/2+80);
    text("leo2099", width/2, height/2+100);
    text("ariel2021", width/2, height/2+120);
  }


  //---Zona de metodos Accesores-------//
  
  /** Modifica el valor del atributo score */
  public void setScore(Integer score) {
    this.score=score;
  }
  /** Obtenemos la variable level */
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
