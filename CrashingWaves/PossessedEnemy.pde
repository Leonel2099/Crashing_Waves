/**
 Representa la clase PossessedEnemy que es heredada de Enemy
 */
class PossessedEnemy extends Enemy {

  //---  Zona de los constructores -----

  /** Constructor por defecto */
  public PossessedEnemy(PVector position, int direction ) {
    this.direction =direction ;
    this.position=position;
    this.widthFrame=48;
    this.heightFrame=48;
    this.widthGO=48;
    this.heightGO=48;
    this.posXframe=0;
    this.posYframe=0;
    selectSprite();
  }

  //---Zona de metodos-------//

  /**Dibuja los enemigos PossessedEnemy*/
  public void display() {
    switch(direction ) {
    case ConstantList.DOWN_DIRECTION:
      PImage frame=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frame, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    case ConstantList.RIGHT_DIRECTION:
      PImage frameOne=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frameOne, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    case ConstantList.LEFT_DIRECTION:
      PImage frameTwo=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frameTwo, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    case ConstantList.UP_DIRECTION:
      PImage frameThree=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      image(frameThree, position.x, position.y);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    }
  }

  /**Dibuja el ataque del PossessedEnemy al player*/
  public void  displayAttackToPlayer(Player player) {
    switch(direction ) {
    case ConstantList.DOWN_DIRECTION://DOWN
      if (this.position.y>=player.getPosition().y-this.heightGO) {
        this.velocity.y=0;
        sprite=requestImage("data/Image/Sprite/PossessedEnemy/Down/PossessedDownAttack01.png");
        PImage possessedEnemyAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(possessedEnemyAttack, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          posXframe+=this.widthFrame;
        }
      }
      break;
    case ConstantList.RIGHT_DIRECTION:
      if (this.position.x>=player.getPosition().x-this.widthGO) {
        this.velocity.x=0;
        sprite=requestImage("data/Image/Sprite/PossessedEnemy/Right/PossessedRightAttack01.png");
        PImage possessedEnemyAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(possessedEnemyAttack, position.x, position.y);
        ;
        if (this.posXframe < sprite.width-this.widthFrame) {
          posXframe+=this.widthFrame;
        }
      }
      break;
    case ConstantList.LEFT_DIRECTION:
      if (this.position.x<=player.getPosition().x+this.widthGO) {
        this.velocity.x=0;
        sprite=requestImage("data/Image/Sprite/PossessedEnemy/Left/PossessedLeftAttack01.png");
        PImage possessedEnemyAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(possessedEnemyAttack, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {

          posXframe+=this.widthFrame;
        }
      }
      break;
    case ConstantList.UP_DIRECTION:
      if (this.position.y<=player.getPosition().y+this.heightGO) {
        this.velocity.y=0;
        sprite=requestImage("data/Image/Sprite/PossessedEnemy/Up/PossessedUpAttack01.png");
        PImage possessedEnemyAttack=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(possessedEnemyAttack, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          posXframe+=this.widthFrame;
        }
      }
      break;
    }
  }

  /**Dibuja el sprite del enemigo PossessedEnemy cuando es derrotado*/
  public void die() {
    this.posXframe=0;
    switch(direction) {
    case ConstantList.DOWN_DIRECTION://DOWN
      sprite=loadImage("data/Image/Sprite/PossessedEnemy/Down/PossesedDownHurt.png");
      PImage possessedEnemyDie=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      frameRate(5);
      image(possessedEnemyDie, position.x, position.y);
      break;
    case ConstantList.RIGHT_DIRECTION:
      sprite=loadImage("data/Image/Sprite/PossessedEnemy/Right/PossesedRightHurt.png");
      PImage possessedEnemyDieOne=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(possessedEnemyDieOne, position.x, position.y);
      frameRate(5);
      break;
    case ConstantList.LEFT_DIRECTION:
      sprite=loadImage("data/Image/Sprite/PossessedEnemy/Left/PossesedLeftHurt.png");
      PImage possessedEnemyDieTwo=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(possessedEnemyDieTwo, position.x, position.y);
      frameRate(5);
      break;
    case ConstantList.UP_DIRECTION:
      sprite=loadImage("data/Image/Sprite/PossessedEnemy/UP/PossesedUpHurt.png");
      PImage possessedEnemyDieThree=sprite.get(this.posXframe+48, this.posYframe, this.widthFrame, this.heightFrame);
      image(possessedEnemyDieThree, position.x, position.y);
      frameRate(5);
      break;
    }
  }


  /**Permite elegir el sprite dependiendo de la direccion*/
  public void selectSprite() {
    if (direction ==ConstantList.DOWN_DIRECTION) {//1==DOWN
      sprite=requestImage("data/Image/Sprite/PossessedEnemy/Down/PossesedDownWalk.png");
    } else if (direction ==ConstantList.RIGHT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/PossessedEnemy/Right/PossesedRightWalk.png");
    } else if (direction ==ConstantList.LEFT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/PossessedEnemy/Left/PossesedLeftWalk.png");
    } else if (direction ==ConstantList.UP_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/PossessedEnemy/Up/PossesedUpWalk.png");
    }
  }
}
