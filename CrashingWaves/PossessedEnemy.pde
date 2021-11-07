/**
 Representa la clase PossessedEnemy que es heredada de Enemy
 */
class PossessedEnemy extends Enemy {

  /** Constructor por defecto */
  public PossessedEnemy(PVector position) {
    elegirSprite();
    this.position=position;
    this.widthFrame=48;
    this.heightFrame=48;
    this.posXframe=0;
    this.posYframe=0;
  }
  //---Zona de metodos-------//

  /**Se Dibuja un enemigos PossessedEnemy*/
  public void display() {
    switch(getOption()) {
    case 1:
      PImage frame=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      frame.resize(60, 60);
      imageMode(CENTER);
      image(frame, position.x, position.y);
      delay(100);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    case 2:
      PImage frame1=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      frame1.resize(60, 60);
      imageMode(CENTER);
      image(frame1, position.x, position.y);
      delay(100);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    case 3:
      PImage frame2=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      frame2.resize(60, 60);
      imageMode(CENTER);
      image(frame2, position.x, position.y);
      delay(100);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    case 4:
      PImage frame3=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
      frame3.resize(60, 60);
      imageMode(CENTER);
      image(frame3, position.x, position.y);
      //delay(60);
      if (this.posXframe < sprite.width-this.widthFrame) {
        posXframe+=this.widthFrame;
      } else {
        posXframe=0;
      }
      break;
    }
  }

  public void elegirSprite() {
    if (getOption()==ConstantList.DOWN_DIRECTION) {//DOWN
      sprite=requestImage("data/Image/Sprite/Possessed Enemy/Down/Png/PossesedDownWalk.png");
    } else if (getOption()==ConstantList.RIGHT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Possessed Enemy/Right/Png/PossesedRightWalk.png");
    } else if (getOption()==ConstantList.LEFT_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Possessed Enemy/Left/Png/PossesedLeftWalk.png");
    } else if (getOption()==ConstantList.UP_DIRECTION) {
      sprite=requestImage("data/Image/Sprite/Possessed Enemy/Up/Png/PossesedUpWalk.png");
    }
  }
}
