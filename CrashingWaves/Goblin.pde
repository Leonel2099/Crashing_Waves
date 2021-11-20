/**
 Representa la clase Goblin que es heredada de Enemy
 */
class Goblin extends Enemy {


  /** Constructor parametrizado */
  public Goblin(PVector position, int direction ) {
    this.direction=direction ;
    this.position=position;
    this.widthFrame=48;
    this.heightFrame=48;
    this.posXframe=0;
    this.posYframe=0;
    selectSprite();
  }

  //---Zona de metodos-------//

  /** Carga el sprite segun la direccion */
  public void selectSprite() {
    if (direction == ConstantList.DOWN_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Goblin/Down/GoblinSlingerDownRun.png");
    } else if (direction == ConstantList.RIGHT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Goblin/Right/GoblinSlingerRightRun.png");
    } else if (direction == ConstantList.LEFT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Goblin/Left/GoblinSlingerLeftRun.png");
    } else if (direction == ConstantList.UP_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Goblin/Up/GoblinSlingerUpRun.png");
    }
  }


  /** Dibuja un enemigo de tipo Goblin*/
  public void display() {
    switch(direction) {
    case ConstantList.DOWN_DIRECTION:
      PImage frameOne=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frameOne, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        this.posXframe+=this.widthFrame;
      } else {
        this.posXframe=0;
      }
      break;
    case ConstantList.RIGHT_DIRECTION:
      PImage frameTwo=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frameTwo, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        this.posXframe+=this.widthFrame;
      } else {
        this.posXframe=0;
      }
      break;
    case ConstantList.LEFT_DIRECTION:
      PImage frameThree=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frameThree, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        this.posXframe+=this.widthFrame;
      } else {
        this.posXframe=0;
      }
      break;
    case ConstantList.UP_DIRECTION:
      PImage frameFour=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frameFour, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        this.posXframe+=this.widthFrame;
      } else {
        this.posXframe=0;
      }
      break;
    }
  }



  /** Dibuja el sprite de ataque que realiza el goblin en las diferentes direcciones */
  public void  displayAttackToPlayer(Player player) {
    if (this.velocity.y==0||this.velocity.x==0) {
      switch(direction) {
      case ConstantList.DOWN_DIRECTION:
        sprite=requestImage("data/Image/Sprite/Goblin/Down/GoblinSlingerDownAttack01.png");
        PImage goblinAttackOne=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(goblinAttackOne, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=this.widthFrame;
        }
        break;
      case ConstantList.RIGHT_DIRECTION:
        sprite=requestImage("data/Image/Sprite/Goblin/Right/GoblinSlingerRightAttack01.png");
        PImage goblinAttackTwo=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(goblinAttackTwo, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=this.widthFrame;
        }
        break;
      case ConstantList.LEFT_DIRECTION:
        sprite=requestImage("data/Image/Sprite/Goblin/Left/GoblinSlingerLeftAttack01.png");
        PImage goblinAttackThree=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(goblinAttackThree, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=this.widthFrame;
        }
        break;
      case ConstantList.UP_DIRECTION:
        sprite=requestImage("data/Image/Sprite/Goblin/UP/GoblinSlingerUpAttack01.png");
        PImage goblinAttackFour=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(goblinAttackFour, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=this.widthFrame;
        }
        break;
      }
    }
  }


  /** Dibuja el sprite de muerte del goblin para las diferentes direcciones */
  public void displayDie(){
    this.posXframe=0;
    switch(direction) {
    case ConstantList.DOWN_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Goblin/Down/GoblinSlingerDownHurt.png");
      PImage goblinDieOne=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(goblinDieOne, position.x, position.y-4);
      break;
    case ConstantList.RIGHT_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Goblin/Right/GoblinSlingerRightHurt.png");
      PImage goblinDieTwo=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(goblinDieTwo, position.x-4, position.y);
      break;
    case ConstantList.LEFT_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Goblin/Left/GoblinSlingerLeftHurt.png");
      PImage goblinDieThree=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(goblinDieThree, position.x+4, position.y);
      break;
    case ConstantList.UP_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Goblin/UP/GoblinSlingerUpHurt.png");
      PImage goblinDieFour=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(goblinDieFour, position.x, position.y+4);
      break;
    }
  }
}
