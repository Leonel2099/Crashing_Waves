/**
 Representa la clase PossessedEnemy que es heredada de Enemy
 */
class PossessedEnemy extends Enemy {

  /** Constructor parametrizado */
  public PossessedEnemy(PVector position, int direction ) {
    this.direction =direction ;
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
      sprite=requestImage("data/Image/Sprite/PossessedEnemy/Down/PossesedDownWalk.png");
    } else if (direction == ConstantList.RIGHT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/PossessedEnemy/Right/PossesedRightWalk.png");
    } else if (direction == ConstantList.LEFT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/PossessedEnemy/Left/PossesedLeftWalk.png");
    } else if (direction == ConstantList.UP_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/PossessedEnemy/Up/PossesedUpWalk.png");
    }
  }


  /**Dibuja un enemigo de tipo PossessedEnemy*/
  public void display() {
    switch(direction) {
    case ConstantList.DOWN_DIRECTION:
      PImage frameOne=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      frameOne.resize(48, 48);
      image(frameOne, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        this.posXframe+=this.widthFrame;
      } else {
        this.posXframe=0;
      }
      break;
    case ConstantList.RIGHT_DIRECTION:
      PImage frameTwo=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      frameTwo.resize(48, 48);
      image(frameTwo, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        this.posXframe+=this.widthFrame;
      } else {
        this.posXframe=0;
      }
      break;
    case ConstantList.LEFT_DIRECTION:
      PImage frameThree=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      frameThree.resize(48, 48);
      image(frameThree, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        this.posXframe+=this.widthFrame;
      } else {
        this.posXframe=0;
      }
      break;
    case ConstantList.UP_DIRECTION:
      PImage frameFour=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      frameFour.resize(48, 48);
      image(frameFour, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        this.posXframe+=this.widthFrame;
      } else {
        this.posXframe=0;
      }
      break;
    }
  }

  /** Dibuja el sprite de ataque que realiza el PossessedEnemy en las diferentes direcciones */
  public void  displayAttackToPlayer(Player player) {
    if (this.velocity.y==0||this.velocity.x==0) {
      switch(direction ) {
      case ConstantList.DOWN_DIRECTION:
        sprite=requestImage("data/Image/Sprite/PossessedEnemy/Down/PossessedDownAttack01.png");
        PImage possessedAttackOne=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(possessedAttackOne, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=this.widthFrame;
        }
        break;
      case ConstantList.RIGHT_DIRECTION:
        sprite=requestImage("data/Image/Sprite/PossessedEnemy/Right/PossessedRightAttack01.png");
        PImage possessedAttackTwo=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(possessedAttackTwo, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=this.widthFrame;
        }
        break;
      case ConstantList.LEFT_DIRECTION:
        sprite=requestImage("data/Image/Sprite/PossessedEnemy/Left/PossessedLeftAttack01.png");
        PImage possessedAttackThree=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(possessedAttackThree, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=this.widthFrame;
        }
        break;
      case ConstantList.UP_DIRECTION:
        sprite=requestImage("data/Image/Sprite/PossessedEnemy/Up/PossessedUpAttack01.png");
        PImage possessedAttackFour=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(possessedAttackFour, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=this.widthFrame;
        }
        break;
      }
    }
  }

  /** Dibuja el sprite de muerte del PossessedEnemy para las diferentes direcciones */
  public void displayDie(){
    this.posXframe=0;
    switch(direction) {
    case ConstantList.DOWN_DIRECTION:
      sprite=loadImage("data/Image/Sprite/PossessedEnemy/Down/PossesedDownHurt.png");
      PImage possessedDieOne=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(possessedDieOne, position.x, position.y-4);
      break;
    case ConstantList.RIGHT_DIRECTION:
      sprite=loadImage("data/Image/Sprite/PossessedEnemy/Right/PossesedRightHurt.png");
      PImage possessedDieTwo=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(possessedDieTwo, position.x-4, position.y);
      break;
    case ConstantList.LEFT_DIRECTION:
      sprite=loadImage("data/Image/Sprite/PossessedEnemy/Left/PossesedLeftHurt.png");
      PImage possessedDieThree=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(possessedDieThree, position.x+4, position.y);
      break;
    case ConstantList.UP_DIRECTION:
      sprite=loadImage("data/Image/Sprite/PossessedEnemy/UP/PossesedUpHurt.png");
      PImage possessedDieFour=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(possessedDieFour, position.x, position.y+4);
      break;
    }
  }
}
