/**
 Representa la clase Player que hereda los atributos
 de FrameObject
 */
class Player extends FrameObject {

  /**Representa la vida del player*/
  private Integer life;
  /**Representa el area a colisionar*/
  private Integer sidePlayer, sidePlayerL;
  /**Representa la colision*/
  private boolean colliding = false;

  // private int posFrame;


  /** Constructor por defecto */
  public Player() {
    this.position = new PVector();
    position.x = width/2;
    position.y = height/2;
    this.widthGO = 48;
    this.heightGO = 48;
    sprite = requestImage("data/Image/Sprite/Player/Down/Png/WarriorDownIdle.png");
    this.widthFrame = 48;
    this.heightFrame = 48;
    this.posXframe = 0;
    this.posYframe = 0;
    this.sidePlayer= 60;
    this.sidePlayerL=39;
  }


  //---Zona de metodos-------//
  /**Se Dibuja al personaje del juego */
  public void display() {
    //Aqui va el codigo donde se dibuja el personaje principal

    sprite = loadImage("data/Image/Sprite/Player/Down/Png/WarriorDownIdle.png");
    PImage spriteDown = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
    spriteDown.resize(60, 60);
    imageMode(CENTER);
    image(spriteDown, this.position.x, this.position.y);
    if (this.posXframe < sprite.width - this.widthFrame) {
      this.posXframe += this.heightFrame;
    } else {
      this.posXframe=0;
    }

    noFill();
    strokeWeight(1);
    stroke(255, 0, 255);
    rectMode(CENTER);
    square(position.x, position.y, sidePlayer);
    stroke(0, 255, 255);
    square(position.x, position.y, sidePlayerL); //-11
  }


  public void attackCircurlarly() {
    //Aqui va un codigo para verificar si hubo colisión en todas las direcciones
  }


  public void attack(int directionAttack) {
    if (directionAttack == 0) {
      display();
    }
    if (directionAttack == 1) {
      if (this.position.y <= enemy.getPosition().y+sidePlayer) {
        colliding = true;
        //println(this.position.y +""+enemy.getPosition().y);
      }
      sprite = loadImage("data/Image/Sprite/Player/Up/Png/WarriorUpAttack01.png");
      PImage spriteUp = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      spriteUp.resize(60, 60);
      imageMode(CENTER);
      image(spriteUp, this.position.x, this.position.y);
      if (this.posXframe < sprite.width - this.widthFrame) {
        this.posXframe += this.widthFrame;
      } else {
        this.posXframe=0;
      }
    }
    if (directionAttack == 2) {
      if (this.position.y <= enemy.getPosition().y+sidePlayer) {
        colliding = true;
      }
      if (this.position.x <= enemy.getPosition().x+sidePlayer) {
        colliding = true;
      }
      if (this.position.y+ sidePlayer >= enemy.getPosition().y){
        colliding = true;
      }
      if (this.position.x+ sidePlayer >= enemy.getPosition().x){
        colliding = true;
      }
        sprite = loadImage("data/Image/Sprite/Player/Right/Png/WarriorRightAttack01.png");
        PImage spriteRight = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        spriteRight.resize(60, 60);
        imageMode(CENTER);
        image(spriteRight, this.position.x, this.position.y);
        if (this.posXframe < sprite.width - this.widthFrame) {
          this.posXframe += this.widthFrame;
        } else {
          this.posXframe=0;
        }
    }

      if (directionAttack == 3) {
        sprite = loadImage("data/Image/Sprite/Player/Down/Png/WarriorDownAttack01.png");
        PImage spriteDown = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        spriteDown.resize(60, 60);
        imageMode(CENTER);
        image(spriteDown, this.position.x, this.position.y);
        if (this.posXframe < sprite.width - this.widthFrame) {
          this.posXframe += this.widthFrame;
        } else {
          this.posXframe=0;
        }
      }
      if (directionAttack == 4) {
        sprite = loadImage("data/Image/Sprite/Player/Left/Png/WarriorLeftAttack01.png");
        PImage spriteDown = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        spriteDown.resize(60, 60);
        imageMode(CENTER);
        image(spriteDown, this.position.x, this.position.y);
        if (this.posXframe < sprite.width - this.widthFrame) {
          this.posXframe += this.widthFrame;
        } else {
          this.posXframe=0;
        }
      }
      println("posicion player :"+position.y +" posicion enemigo:"+enemy.getPosition().y);
    }

    public void lostLife() {
      //Aqui va un codigo que indica cuanta vida pierde el player por colision
    }

    public void keyPressed() {
      int directionAttack=0;
      if (keyPressed) {
        if (key == 'w' || key == 'W' || keyCode == UP) {
          directionAttack = 1;
        }
        if (key == 'd' || key == 'D' || keyCode == RIGHT) {
          directionAttack = 2;
        }
        if (key == 's' || key == 'S' || keyCode == DOWN) {
          directionAttack = 3;
        }
        if (key == 'a' || key == 'A' || keyCode == LEFT) {
          directionAttack = 4;
        }
        attack(directionAttack);
      }
    }

    public void keyReleased() {
      if (keyPressed == false) {
        display();
      }
    }


    //---Zona de metodos Accesores-------//

    /** Modifica el valor del atributo life */
    public void setLife(Integer life) {
      this.life = life;
    }
    /** Obtenemos la variable life */
    public Integer getLevel() {
      return this.life;
    }
    public void setColliding(boolean colliding) {
      this.colliding = colliding;
    }
    /** Obtenemos la variable life */
    public boolean isColliding() {
      return this.colliding;
    }
  }
