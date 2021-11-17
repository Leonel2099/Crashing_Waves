/**
 Representa la clase Player que hereda los atributos
 de FrameObject
 */
class Player extends FrameObject {

  /**Representa la vida del player*/
  private Integer life;
  
  /**Representa la direccion a la que apunta el player en número*/
  private Integer direction;


  /** Constructor por defecto */
  public Player() {
    this.life=100;
    this.position = new PVector();
    position.x = 326;
    position.y = 326;
    this.widthGO = 48;
    this.heightGO = 48;
    sprite = requestImage("data/Image/Sprite/Player/Down/Png/WarriorDownIdle.png");
    this.widthFrame = 48;
    this.heightFrame = 48;
    this.posXframe = 0;
    this.posYframe = 0;
  }


  //---Zona de metodos-------//
  /**Se Dibuja al personaje del juego */
  public void display() {
    sprite = loadImage("data/Image/Sprite/Player/Down/Png/WarriorDownIdle.png");
    PImage spriteDown = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame); 
    image(spriteDown, this.position.x, this.position.y);
    if (this.posXframe < sprite.width - this.widthFrame) {
      this.posXframe += this.heightFrame;
    } else {
      this.posXframe=0;
    }
  }

  /**Disminuye la variable vida cada vez que el enemigo golpee al player*/
  public void lostLife() {
    this.life--;
  }

  /**Vizualiza el sprite para la barra de vida en sus diferentes estados y depende de una variable heal*/
  public void displayLifeBar(int heal) {
    if (heal<=100) {     
      PImage barLife = loadImage("data/Image/Sprite/HealthBar/Png/BarLife.png");
      PImage lifeBar = barLife.get(this.posXframe, this.posYframe, 300, 40);
      lifeBar.resize(300, 40);
      image(lifeBar, 0, 20);
      switch(heal) {
      case 90:
        this.posYframe=40;
        break;
      case 80:
        this.posYframe=80;
        break;
      case 70:
        this.posYframe=120;
        break;
      case 60:
        this.posYframe=160;
        break;
      case 50:
        this.posYframe=200;
        break;
      case 40:
        this.posYframe=240;
        break;
      case 30:
        this.posYframe=280;
        break;
      case 20:
        this.posYframe=320;
        break;
      case 10:
        this.posYframe=360;
        break;
      case 6:
        this.posYframe=400;
        break;
      }
      if (heal<3) {
        this.posYframe=0;
      }
    }
  }


  /**Vizualiza el sprite del player recibiendo daño*/
  public void displayPlayerHurt() {
    sprite = loadImage("data/Image/Sprite/Player/Down/Png/WarriorDownHurt.png");
    PImage spriteDown = sprite.get(this.posXframe+96, this.posYframe, this.widthFrame, this.heightFrame);
    image(spriteDown, this.position.x, this.position.y);
  }


  /**Este metodo evalua si el player colisiona con el enemigo mediante su ataque*/
  public boolean colliding(Enemy enemy) {
    if (((this.position.y-46)==enemy.getPosition().y)&&direction==ConstantList.UP_DIRECTION_ATTACK) {
      sword.setGain(-5);
      sword.play();
      sword.rewind();
      enemy.die();
      return true;
    }
    if (this.position.x+46==(enemy.getPosition().x)&&direction==ConstantList.LEFT_DIRECTION_ATTACK) {
      sword.setGain(-5);
      sword.play();
      sword.rewind();
      enemy.die();
      return true;
    }
    if (this.position.x-46==(enemy.getPosition().x)&&direction==ConstantList.RIGHT_DIRECTION_ATTACK) {
      sword.setGain(-5);
      sword.play();
      sword.rewind();
      enemy.die();
      return true;
    }
    if ((this.position.y+46==(enemy.getPosition().y))&&direction==ConstantList.DOWN_DIRECTION_ATTACK) {
      sword.setGain(-5);
      sword.play();
      sword.rewind();
      enemy.die();
      return true;
    }
    if (direction==ConstantList.ALL_DIRECTION_ATTACK) {
      if ((this.position.y-46==(enemy.getPosition().y))||(this.position.x+46==(enemy.getPosition().x))||(this.position.y+46==(enemy.getPosition().y))||(this.position.x-46==(enemy.getPosition().x))) {
        sword.setGain(-5);
        sword.play();   
        sword.rewind();
        enemy.die();
        return true;
      }
    }
    return false;
  }


  /**Carga el sprite del ataque especial*/
  public void attackCircurlarly(int attack) {
    if (attack == 5) {
      sprite = loadImage("data/Image/Sprite/Player/Down/Png/WarriorAttackCircularly.png");
      PImage spriteDown = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(spriteDown, this.position.x, this.position.y);
      if (this.posXframe < sprite.width - this.widthFrame) {
        this.posXframe += this.widthFrame;
      } else {
        this.posXframe=0;
      }
    }
  }

  /**Carga los sprites del personaje que usara para el ataque*/
  public void attack(int directionAttack) {
    if (directionAttack == 0) {
      display();
    }
    if (directionAttack == 1) {
      sword2.setGain(-5);
      sword2.play();
      sword2.rewind();
      sprite = loadImage("data/Image/Sprite/Player/Up/Png/WarriorUpAttack01.png");
      PImage spriteUp = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(spriteUp, this.position.x, this.position.y);
      if (this.posXframe < sprite.width - this.widthFrame) {
        this.posXframe += this.widthFrame;
      } else {
        this.posXframe=0;
      }
    }
    if (directionAttack == 2) {
      sword2.setGain(-5);
      sword2.play();
      sword2.rewind();
      sprite = loadImage("data/Image/Sprite/Player/Right/Png/WarriorRightAttack01.png");
      PImage spriteRight = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(spriteRight, this.position.x, this.position.y);
      if (this.posXframe < sprite.width - this.widthFrame) {
        this.posXframe += this.widthFrame;
      } else {
        this.posXframe=0;
      }
    }
    if (directionAttack == 3) {
      sword2.setGain(-5);
      sword2.play();
      sword2.rewind();
      sprite = loadImage("data/Image/Sprite/Player/Down/Png/WarriorDownAttack01.png");
      PImage spriteDown = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(spriteDown, this.position.x, this.position.y);
      if (this.posXframe < sprite.width - this.widthFrame) {
        this.posXframe += this.widthFrame;
      } else {
        this.posXframe=0;
      }
    }
    if (directionAttack == 4) {
      sword2.setGain(-5);
      sword2.play();
      sword2.rewind();
      sprite = loadImage("data/Image/Sprite/Player/Left/Png/WarriorLeftAttack01.png");
      PImage spriteDown = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(spriteDown, this.position.x, this.position.y);
      if (this.posXframe < sprite.width - this.widthFrame) {
        this.posXframe += this.widthFrame;
      } else {
        this.posXframe=0;
      }
    }
  }
  
  /** Evaluamos la tecla presionada y ejecutar una accion */
  public void keyTyped() {
    this.direction = 0;
    if (keyPressed) {
      if (key == 'w' || key == 'W' || keyCode == UP) {
        this.direction = ConstantList.UP_DIRECTION_ATTACK;
      }
      if (key == 'a' || key == 'A' || keyCode == LEFT) {
        this.direction = ConstantList.RIGHT_DIRECTION_ATTACK;
      }
      if (key == 's' || key == 'S' || keyCode == DOWN) {
        this.direction = ConstantList.DOWN_DIRECTION_ATTACK;
      }
      if (key == 'd' || key == 'D' || keyCode == RIGHT) {
        this.direction = ConstantList.LEFT_DIRECTION_ATTACK;
      }
      if (key == ' ') {
        this.direction = ConstantList.ALL_DIRECTION_ATTACK;
      }
      attack(this.direction);
      attackCircurlarly(this.direction);
    }
  }
  
  /** Solo ejecutamos una accion hasta dejar de presionar la tecla */
  public void keyReleased() {
    if (keyPressed==false) {
      display();
    }
  }



  //---Zona de metodos Accesores-------//

  /** Modifica el valor del atributo life */
  public void setLife(Integer life) {
    this.life = life;
  }
  /** Obtenemos la variable life */
  public Integer getLife() {
    return this.life;
  }
  /** Modifica el valor del atributo direction */
  public void setDirection(Integer direction){
    this.direction = direction;
  }
  /** Obtenemos la variable direction*/
  public int getDirection() {
    return this.direction;
  }
}
