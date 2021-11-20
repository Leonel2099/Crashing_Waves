/**
 Representa la clase Skeleton que es heredada de Enemy
 */
class Skeleton extends Enemy {

  /** Constructor parametrizado */
  public Skeleton(PVector position, int direction ) {
    this.direction =direction ;
    this.position=position;
    this.widthFrame=48;
    this.heightFrame=48;
    this.posXframe=0;
    this.posYframe=0;
    this.widthGO = 48;
    this.heightGO = 48;
    selectSprite();
  }

  //---Zona de metodos-------//


  /** Carga el sprite segun direccion */
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


  /**Dibuja un enemigos de tipo Skeleton*/
  public void display() {
    switch(direction ) {
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

  /** Dibuja el sprite de ataque que realiza el Skeleton en las diferentes direcciones */
  public void  displayAttackToPlayer(Player player) {
    if (this.velocity.y==0||this.velocity.x==0) {
      switch(direction) {
      case ConstantList.DOWN_DIRECTION:
        sprite=requestImage("data/Image/Sprite/Skeleton/Down/SkeletonWithSwordDownAttack01.png");
        PImage skeletonAttackOne=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(skeletonAttackOne, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=this.widthFrame;
        }
        break;
      case ConstantList.RIGHT_DIRECTION:
        sprite=requestImage("data/Image/Sprite/Skeleton/Right/SkeletonWithSwordRightAttack01.png");
        PImage skeletonAttackTwo=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(skeletonAttackTwo, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=widthFrame;
        }
        break;
      case ConstantList.LEFT_DIRECTION:
        sprite=requestImage("data/Image/Sprite/Skeleton/Left/SkeletonWithSwordLeftAttack01.png");
        PImage skeletonAttackThree=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(skeletonAttackThree, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=widthFrame;
        }
        break;
      case ConstantList.UP_DIRECTION:
        sprite=requestImage("data/Image/Sprite/Skeleton/Up/SkeletonWithSwordUpAttack01.png");
        PImage skeletonAttackFour=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
        image(skeletonAttackFour, position.x, position.y);
        if (this.posXframe < sprite.width-this.widthFrame) {
          this.posXframe+=widthFrame;
        }
        break;
      }
    }
  }

  /** Dibuja el sprite de muerte del Skeleton para las diferentes direcciones */  
  public void displayDie()  {
    this.posXframe=0;
    switch(direction) {
    case ConstantList.DOWN_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Skeleton/Down/SkeletonWithSwordDownHurt.png");
      PImage skeletonDie=sprite.get(this.posXframe + widthGO, this.posYframe, this.widthFrame, this.heightFrame);
      image(skeletonDie, position.x, position.y-4);
      break;
    case ConstantList.RIGHT_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Skeleton/Right/SkeletonWithSwordRightHurt.png");
      PImage skeletonDieTwo=sprite.get(this.posXframe + widthGO, this.posYframe, this.widthFrame, this.heightFrame);
      image(skeletonDieTwo, position.x-4, position.y);
      break;
    case ConstantList.LEFT_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Skeleton/Left/SkeletonWithSwordLeftHurt.png");
      PImage skeletonDieThree=sprite.get(this.posXframe+ widthGO, this.posYframe, this.widthFrame, this.heightFrame);
      image(skeletonDieThree, position.x+4, position.y);
      break;
    case ConstantList.UP_DIRECTION:
      sprite=loadImage("data/Image/Sprite/Skeleton/UP/SkeletonWithSwordUpHurt.png");
      PImage skeletonDieFour=sprite.get(this.posXframe+ widthGO, this.posYframe, this.widthFrame, this.heightFrame);
      image(skeletonDieFour, position.x, position.y+4);
      break;
    }
  }
}
