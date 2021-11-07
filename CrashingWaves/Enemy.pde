/**
 Representa la clase Enemy que hereda los atributos
 de FrameObject
 */
class Enemy extends FrameObject {

  public int option=1;//(int)random(1,5); De momento a modo de prueba representa el spawn en la parte superior
  /**Representa la velocidad de los enemgios*/
  protected PVector velocity;
  /**Representa el tipo de numero de los enemigos*/
  protected Integer rank=1; //parcialmente spawnean enemigos goblins
  /**Representa el nivel del daño provocado al jugador*/
  protected Integer damageLevel;
  /**Representa el rango de colision*/
  private Integer sideEnemy;

  /** Constructor por defecto */
  public Enemy() {
    this.velocity=new PVector(3,3);
    this.position=new PVector();
    this.sideEnemy=60;
  }

  //---Zona de metodos-------//


  //dibujo de los enemigos
 public void display(){
   //imageMode(CENTER);
   image(this.sprite,position.x,position.y,48,48);
 }

  /**movimientos de los enemgios*/
  public void moveToCenter() {
    switch(getOption()) {
    case 1:
      if (position.y+sideEnemy < jugador.getPosition().y+sideEnemy/6) {
        position.y=position.y+velocity.y;//DOWN
        noFill();
        strokeWeight(1);
        //rectMode(CENTER);
        enemy.getPosition().x=position.x;
        enemy.getPosition().y=position.y;
        //square(enemy.getPosition().x,enemy.getPosition().y,sideEnemy);
        if (position.y+sideEnemy == jugador.getPosition().y+sideEnemy/6) {
          sprite=requestImage("data/Image/Sprite/Goblin/Down/GoblinSlingerDownAttack01.png");
          PImage goblinAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
          goblinAttack.resize(60, 60);
          imageMode(CENTER);
          image(goblinAttack, position.x, position.y);
          //delay(100);
          if (this.posXframe < sprite.width-this.widthFrame) {
            posXframe+=this.widthFrame;
          }
        }
        stroke(255, 0, 0);
        square(enemy.getPosition().x, enemy.getPosition().y, sideEnemy);
      }
      break;

    case 2:
      if (position.x+sideEnemy < jugador.getPosition().x+sideEnemy/6) {
        position.x=position.x+velocity.x;//LEFT
        noFill();
        strokeWeight(1);
        rectMode(CENTER);
        enemy.getPosition().x=position.x;
        enemy.getPosition().y=position.y;
        if (enemy.getPosition().x+sideEnemy == jugador.getPosition().x+sideEnemy/6) {
          sprite=requestImage("data/Image/Sprite/Goblin/Right/GoblinSlingerRightAttack01.png");
          PImage gAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
          gAttack.resize(60, 60);
          imageMode(CENTER);
          image(gAttack, position.x, position.y);
          //delay(100);
          if (this.posXframe < sprite.width-this.widthFrame) {
            posXframe+=this.widthFrame;
          }
        }
        square(enemy.getPosition().x, enemy.getPosition().y, sideEnemy);
      }
      break;
    case 3:
      if (position.x + sideEnemy/6 > jugador.getPosition().x+sideEnemy) {
        position.x=position.x-velocity.x;//RIGHT
    
        noFill();
        strokeWeight(1);
        stroke(255, 0, 0);
        rectMode(CENTER);
        enemy.getPosition().x=position.x;
        enemy.getPosition().y=position.y;
        if (enemy.getPosition().x == jugador.getPosition().x+sideEnemy+20) {
          
          sprite=requestImage("data/Image/Sprite/Goblin/Left/GoblinSlingerLeftAttack01.png");
          PImage goblinAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
          goblinAttack.resize(60, 60);
          imageMode(CENTER);
          image(goblinAttack, position.x, position.y);
          //delay(100);
          if (this.posXframe < sprite.width-this.widthFrame) {

            posXframe+=this.widthFrame;
          }
        }
        square(enemy.getPosition().x, enemy.getPosition().y, sideEnemy);
      }
      break;

    case 4:
      if (position.y + sideEnemy/6  > jugador.getPosition().y + sideEnemy) {
        position.y=position.y-velocity.y;//UP
        println();
        noFill();
        strokeWeight(1);
        stroke(255, 0, 0);
        rectMode(CENTER);
        enemy.getPosition().x=position.x;
        enemy.getPosition().y=position.y;
        if (enemy.getPosition().y + sideEnemy/6 == jugador.getPosition().y + sideEnemy) {
          sprite=requestImage("data/Image/Sprite/Goblin/Down/GoblinSlingerDownAttack01.png");
          PImage gAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
          gAttack.resize(60, 60);
          imageMode(CENTER);
          image(gAttack, position.x, position.y);
          //delay(100);
          if (this.posXframe < sprite.width-this.widthFrame) {
            posXframe+=this.widthFrame;
          }
          square(enemy.getPosition().x, enemy.getPosition().y, sideEnemy);
        }
        square(enemy.getPosition().x, enemy.getPosition().y, sideEnemy);
        break;
      }
      
    }
  }

  /**ejecuta el ataque dl jugador*/
  public void  attackPlayer() {
    //Aqui va el codigo de colison de los enemigos con el personaje
  }
  
  

  //---Zona de metodos Accesores-------//
  
  /** Modifica el valor del atributo option */
  public void setOption(int option) {
    this.option=option;
  }
  /** Obtenemos la variable option */
  public int getOption(){
    return this.option;
  }
  
  /** Modifica el valor del atributo velocidad */
  public void setVelocity(PVector velocity) {
    this.velocity=velocity;
  }
  /** Obtenemos la variable velocidad */
  public PVector getVelocity() {
    return this.velocity;
  }
  /** Modifica el valor del atributo de rango del enemigo */
  public void setRank(Integer rank) {
    this.rank=rank;
  }
  /** Obtenemos la variable de rango del enemigo */
  public Integer getRank() {
    return this.rank;
  }
  /** Modifica el valor del atributo nivel de daño */
  public void setDamageLevel(Integer damageLevel) {
    this.damageLevel=damageLevel;
  }
  /** Obtenemos la variable nivel de daño */
  public Integer getDamageLevel() {
    return this.damageLevel;
  }
}
