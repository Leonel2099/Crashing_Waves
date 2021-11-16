/**
 Representa la clase Goblin que es heredada de Enemy
 */
class Goblin extends Enemy {


  /** Constructor por defecto */
  public Goblin(PVector position, int direction ) {
    this.direction =direction ;
    this.position=position;
    this.widthGO=48;
    this.heightGO=48;
    this.widthFrame=48;
    this.heightFrame=48;
    this.posXframe=0;
    this.posYframe=0;
    selectSprite();
  }

  //---Zona de metodos-------//
  /** Dibuja un enemigo de tipo Goblin*/
  public void display() {
    switch(direction) {
    case ConstantList.DOWN_DIRECTION:
      PImage frameOne=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frameOne, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    case ConstantList.RIGHT_DIRECTION:
      PImage frameTwo=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frameTwo, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    case ConstantList.LEFT_DIRECTION:
      PImage frameThree=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frameThree, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    case ConstantList.UP_DIRECTION:
      PImage frameFour=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frameFour, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    }
  }

  /** Dibuja el sprite de ataque que realiza el goblin en las diferentes direcciones */
  public void  displayAttackToPlayer(Player player) {
    switch(direction ) {
    case ConstantList.DOWN_DIRECTION:
      if (this.position.y>=player.getPosition().y - this.heightGO) {
        this.velocity.y=0;
        sprite=requestImage("data/Image/Sprite/Goblin/Down/GoblinSlingerDownAttack01.png");
        PImage goblinAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(goblinAttack, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          posXframe+=this.widthFrame;
        }
      }
      break;
    case ConstantList.RIGHT_DIRECTION:
      if (this.position.x>=player.getPosition().x - this.widthGO) {
        this.velocity.x=0;
        sprite=requestImage("data/Image/Sprite/Goblin/Right/GoblinSlingerRightAttack01.png");
        PImage goblinAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(goblinAttack, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          posXframe+=this.widthFrame;
        }
      }
      break;
    case ConstantList.LEFT_DIRECTION:
      if (this.position.x<=player.getPosition().x + this.widthGO) {
        this.velocity.x=0;
        sprite=requestImage("data/Image/Sprite/Goblin/Left/GoblinSlingerLeftAttack01.png");
        PImage goblinAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(goblinAttack, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          posXframe+=this.widthFrame;
        }
      }
      break;
    case ConstantList.UP_DIRECTION:
      if (this.position.y<=player.getPosition().y + this.heightGO) {
        this.velocity.y=0;
        sprite=requestImage("data/Image/Sprite/Goblin/UP/GoblinSlingerUpAttack01.png");
        PImage goblinAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(goblinAttack, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          posXframe+=this.widthFrame;
        }
      }
      break;
    }
  }


  /** Dibuja el sprite de muerte del goblin para las diferentes direcciones */
  public void die() {
    this.posXframe=0;
    switch(direction) {
    case ConstantList.DOWN_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Goblin/Down/GoblinSlingerDownHurt.png");
      PImage goblinDieOne=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      frameRate(5);
      image(goblinDieOne, position.x, position.y);
      break;
    case ConstantList.RIGHT_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Goblin/Right/GoblinSlingerRightHurt.png");
      PImage goblinDieTwo=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(goblinDieTwo, position.x, position.y);
      frameRate(5);
      break;
    case ConstantList.LEFT_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Goblin/Left/GoblinSlingerLeftHurt.png");
      PImage goblinDieThree=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(goblinDieThree, position.x, position.y);
      frameRate(5);
      break;
    case ConstantList.UP_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Goblin/UP/GoblinSlingerUpHurt.png");
      PImage goblinDieFour=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(goblinDieFour, position.x, position.y);
      frameRate(5);
      break;
    }
  }

  /** Metodo que carga el sprite segun direccion */
  public void selectSprite() {
    if (direction ==ConstantList.DOWN_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Goblin/Down/GoblinSlingerDownRun.png");
    } else if (direction ==ConstantList.RIGHT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Goblin/Right/GoblinSlingerRightRun.png");
    } else if (direction ==ConstantList.LEFT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Goblin/Left/GoblinSlingerLeftRun.png");
    } else if (direction ==ConstantList.UP_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Goblin/Up/GoblinSlingerUpRun.png");
    }
  }
}
