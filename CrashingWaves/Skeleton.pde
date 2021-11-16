/**
 Representa la clase Skeleton que es heredada de Enemy
 */
class Skeleton extends Enemy {

  /** Constructor por defecto */
  public Skeleton(PVector position,int direction ) {
    this.direction =direction ;
    selectSprite();
    this.position=position;
    this.widthGO=48;
    this.heightGO=48;
    this.widthFrame=48;
    this.heightFrame=48;
    this.posXframe=0;
    this.posYframe=0;
  }

  //---Zona de metodos-------//

  /**Se Dibuja un enemigos de tipo Skeleton*/
  public void display() {
    switch(direction ) {
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
  
  /** Vizualiza al enemigo atacando */
  public void  displayAttackToPlayer(Player player){
    switch(direction) {
    case ConstantList.DOWN_DIRECTION:
      if (this.position.y>=player.getPosition().y - this.heightGO) {
        this.velocity.y=0;
        sprite=requestImage("data/Image/Sprite/Skeleton/Down/SkeletonWithSwordDownAttack01.png");
        PImage skeletonAttackOne=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(skeletonAttackOne, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          posXframe+=this.widthFrame;
        }
      }
      break;
    case ConstantList.RIGHT_DIRECTION:
      if (this.position.x>=player.getPosition().x - this.widthGO) {
        this.velocity.x=0;
        sprite=requestImage("data/Image/Sprite/Skeleton/Right/SkeletonWithSwordRightAttack01.png");
        PImage skeletonAttackTwo=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(skeletonAttackTwo, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          posXframe+=this.widthFrame;
        }
      }
      break;
    case ConstantList.LEFT_DIRECTION:
      if (this.position.x<=player.getPosition().x + this.widthGO) {
        this.velocity.x=0;
        sprite=requestImage("data/Image/Sprite/Skeleton/Left/SkeletonWithSwordLeftAttack01.png");
        PImage skeletonAttackThree=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(skeletonAttackThree, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {

          posXframe+=this.widthFrame;
        }
      }
      break;
    case ConstantList.UP_DIRECTION:
      if (this.position.y<=player.getPosition().y + this.heightGO) {
        this.velocity.y=0;
        sprite=requestImage("data/Image/Sprite/Skeleton/Up/SkeletonWithSwordUpAttack01.png");
        PImage skeletonAttackFour=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(skeletonAttackFour, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          posXframe+=this.widthFrame;
        }
      }
      break;
    }
  }
  
  /** Visualiza el sprite de la muerte del enemigo */
  public void die(){
    this.posXframe=0;
    switch(direction) {
      case ConstantList.DOWN_DIRECTION:
        sprite=loadImage("data/Image/Sprite/Skeleton/Down/SkeletonWithSwordDownHurt.png");
        PImage skeletonDie=sprite.get(this.posXframe + this.widthGO, this.posYframe, this.widthFrame, this.heightFrame);
        frameRate(5);
        image(skeletonDie, position.x, position.y);
        break;
      case ConstantList.RIGHT_DIRECTION:
        sprite=loadImage("data/Image/Sprite/Skeleton/Right/SkeletonWithSwordRightHurt.png");
        PImage skeletonDieTwo=sprite.get(this.posXframe + this.widthGO, this.posYframe, this.widthFrame, this.heightFrame);
        image(skeletonDieTwo, position.x, position.y);
        frameRate(5);
        break;
      case ConstantList.LEFT_DIRECTION:
        sprite=loadImage("data/Image/Sprite/Skeleton/Left/SkeletonWithSwordLeftHurt.png");
        PImage skeletonDieThree=sprite.get(this.posXframe+this.widthGO, this.posYframe, this.widthFrame, this.heightFrame);
        image(skeletonDieThree, position.x, position.y);
        frameRate(5);
        break;
      case ConstantList.UP_DIRECTION:
        sprite=loadImage("data/Image/Sprite/Skeleton/UP/SkeletonWithSwordUpHurt.png");
        PImage skeletonDieFour=sprite.get(this.posXframe+this.widthGO, this.posYframe, this.widthFrame, this.heightFrame);
        image(skeletonDieFour, position.x, position.y);
        frameRate(5);
        break;
    }
  }
  
  /** Metodo que carga el sprite segun direccion */
  public void selectSprite() {
    if (direction == ConstantList.DOWN_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Skeleton/Down/SkeletonWithSwordDownWalk.png");
    } else if (direction ==ConstantList.RIGHT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Skeleton/Right/SkeletonWithSwordRightRun.png");
    } else if (direction ==ConstantList.LEFT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Skeleton/Left/SkeletonWithSwordLeftRun.png");
    } else if (direction ==ConstantList.UP_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Skeleton/Up/SkeletonWithSwordUpWalk.png");
    }
  }
}
