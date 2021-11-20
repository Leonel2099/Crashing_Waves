/**
 Representa la clase Player que hereda los atributos
 de FrameObject
 */
class Player extends FrameObject {

  /**Representa la vida del player*/
  private Integer life;

  /**Representa la direccion a la que apunta el player en número*/
  private Integer direction;

  /**Representa la cantidad de cargas del ataque especial */
  private int charger;


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
    this.charger = 8;
  }


  //---Zona de metodos-------//
  
  /**Dibuja al personaje del juego */
  public void display() {
    sprite = loadImage("data/Image/Sprite/Player/Down/Png/WarriorDownIdle.png");
    PImage spriteDown = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
    spriteDown.resize(53, 53);
    image(spriteDown, this.position.x-3, this.position.y-3);
    if (this.posXframe < sprite.width - this.widthFrame) {
      this.posXframe += this.heightFrame;
    } else {
      this.posXframe=0;
    }
  }
  
  /**Restablece las cargas cuando avanza de nivel*/
  public void resetCharger(int level, int score) {
    if (score==300&&level==ConstantList.SECOND_LEVEL) {
      if (this.charger>=0||this.charger<=8) {
        this.charger+=1;
      }
    }
    if (score==660&&level==ConstantList.THIRD_LEVEL) {
      if (this.charger>=0||this.charger<=8) {
        this.charger+=1;
      }
    }
  }

  
  /**Visualiza las cantidad de cargas disponibles del ataque especial*/
  public void displayChargerAttack(int charger) {
    fill(255);
    PFont chargerText;
    chargerText=createFont("alagard.ttf", 20);
    textAlign(CENTER);
    textFont(chargerText);
    if (charger<=0) {
      text("x"+0, 95, 55);
    } else {
      text("x"+charger, 95, 55);
    }
    fill(#8B4D0A);
  }


  /**Visualiza el sprite para la barra de vida */
  public void displayLifeBar(int heal, int state) {
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
      case 0:
        this.posYframe=400;
        break;
      }
      if (state==ConstantList.GAME_OVER||state==ConstantList.VICTORY) {
        this.posYframe=0;
      }
    }
  }


  /**Evalua si el player colisiona con el enemigo mediante su ataque*/
  public boolean colliding(Enemy enemy) {
    if (!(this.position.y>enemy.getPosition().y+48||(this.position.x+48<(enemy.getPosition().x))||(this.position.x>(enemy.getPosition().x+48))||(this.position.y+48<(enemy.getPosition().y)))) {
      getSword().setGain(-5);
      getSword().play();
      getSword().rewind();
      return true;
    }
    return false;
  }


  /**Visualiza el sprite del ataque especial*/
  public void attackCircurlarly(int attack) {
    if (attack == ConstantList.ALL_DIRECTION_ATTACK) {
      sprite = loadImage("data/Image/Sprite/Player/Down/Png/WarriorAttackCircularly.png");
      PImage spriteDown = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      spriteDown.resize(53, 53);
      image(spriteDown, this.position.x-3, this.position.y-3);
      if (this.posXframe < sprite.width - this.widthFrame) {
        this.posXframe += this.widthFrame;
      } else {
        this.posXframe=0;
      }
    }
  }

  /**Visualiza los sprite de ataque del jugador dependiendo sus direcciones*/
  public void attack(int directionAttack) {
    if (directionAttack == 0) {
      display();
    }
    if (directionAttack == ConstantList.UP_DIRECTION_ATTACK) {
      getSword2().setGain(-5);
      getSword2().play();
      getSword2().rewind();
      sprite = loadImage("data/Image/Sprite/Player/Up/Png/WarriorUpAttack01.png");
      PImage spriteUp = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      spriteUp.resize(53, 53);
      image(spriteUp, this.position.x-3, this.position.y-13);
      if (this.posXframe < sprite.width - this.widthFrame) {
        this.posXframe += this.widthFrame;
      } else {
        this.posXframe=0;
      }
    }
    if (directionAttack == ConstantList.RIGHT_DIRECTION_ATTACK) {
      getSword2().setGain(-5);
      getSword2().play();
      getSword2().rewind();
      sprite = loadImage("data/Image/Sprite/Player/Right/Png/WarriorRightAttack01.png");
      PImage spriteRight = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      spriteRight.resize(53, 53);
      image(spriteRight, this.position.x+10, this.position.y-6);
      if (this.posXframe < sprite.width - this.widthFrame) {
        this.posXframe += this.widthFrame;
      } else {
        this.posXframe=0;
      }
    }
    if (directionAttack == ConstantList.DOWN_DIRECTION_ATTACK) {
      getSword2().setGain(-5);
      getSword2().play();
      getSword2().rewind();
      sprite = loadImage("data/Image/Sprite/Player/Down/Png/WarriorDownAttack01.png");
      PImage spriteDown = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      spriteDown.resize(53, 53);
      image(spriteDown, this.position.x-3, this.position.y+10);
      if (this.posXframe < sprite.width - this.widthFrame) {
        this.posXframe += this.widthFrame;
      } else {
        this.posXframe=0;
      }
    }
    if (directionAttack == ConstantList.LEFT_DIRECTION_ATTACK) {
      getSword2().setGain(-5);
      getSword2().play();
      getSword2().rewind();
      sprite = loadImage("data/Image/Sprite/Player/Left/Png/WarriorLeftAttack01.png");
      PImage spriteLeft = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      spriteLeft.resize(53, 53);
      image(spriteLeft, this.position.x-13, this.position.y-6);
      if (this.posXframe < sprite.width - this.widthFrame) {
        this.posXframe += this.widthFrame;
      } else {
        this.posXframe=0;
      }
    }
  }


  /**Visualiza el sprite del player recibiendo daño*/
  public void displayPlayerHurt() {
    if (this.direction==0) {
      sprite = loadImage("data/Image/Sprite/Player/Down/Png/WarriorDownHurt.png");
      PImage spriteStill= sprite.get(this.posXframe+96, this.posYframe, this.widthFrame, this.heightFrame);
      spriteStill.resize(53, 53);
      image(spriteStill, this.position.x-3, this.position.y+1);
    }
    if (this.direction==ConstantList.UP_DIRECTION_ATTACK) {
      sprite = loadImage("data/Image/Sprite/Player/Up/Png/WarriorUpHurt.png");
      PImage spriteUp = sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      spriteUp.resize(53, 53);
      image(spriteUp, this.position.x-3, this.position.y-10);
    }
    if (this.direction==ConstantList.DOWN_DIRECTION_ATTACK) {
      sprite = loadImage("data/Image/Sprite/Player/Down/Png/WarriorDownHurtAttack.png");
      PImage spriteDown = sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      spriteDown.resize(53, 53);
      image(spriteDown, this.position.x-3, this.position.y+4);
    }
    if (this.direction==ConstantList.LEFT_DIRECTION_ATTACK) {
      sprite = loadImage("data/Image/Sprite/Player/Left/Png/WarriorLeftHurt.png");
      PImage spriteLeft = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      spriteLeft.resize(53, 53);
      image(spriteLeft, this.position.x-10, this.position.y-6);
    }
    if (this.direction==ConstantList.RIGHT_DIRECTION_ATTACK) {
      sprite = loadImage("data/Image/Sprite/Player/Right/Png/WarriorRightHurt.png");
      PImage spriteRight = sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      spriteRight.resize(53, 53);
      image(spriteRight, this.position.x+8, this.position.y-7);
    }
  }


  /**Disminuye la variable vida cada vez que el enemigo golpee al player*/
  public void lostLife() {
    this.life--;
  }


  /** Evaluamos la tecla presionada y ejecutar una accion */
  public void keyTyped() {
    this.direction = 0;
    if (keyPressed) {
      if (key == 'w' || key == 'W' || keyCode == UP) {
        this.direction = ConstantList.UP_DIRECTION_ATTACK;
      }
      if (key == 'a' || key == 'A' || keyCode == LEFT) {
        this.direction = ConstantList.LEFT_DIRECTION_ATTACK;
      }
      if (key == 's' || key == 'S' || keyCode == DOWN) {
        this.direction = ConstantList.DOWN_DIRECTION_ATTACK;
      }
      if (key == 'd' || key == 'D' || keyCode == RIGHT) {
        this.direction = ConstantList.RIGHT_DIRECTION_ATTACK;
      }
      if (this.charger>=0) {
        if (key == ' ') {
          this.direction = ConstantList.ALL_DIRECTION_ATTACK;
        }
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
  public void setDirection(Integer direction) {
    this.direction = direction;
  }
  /** Obtenemos la variable direction*/
  public int getDirection() {
    return this.direction;
  }
  /** Modifica el valor del atributo charger */
  public void setCharger(int charger) {
    this.charger=charger;
  }
  /** Obtenemos la variable charger*/
  public int getCharger() {
    return this.charger;
  }
}
