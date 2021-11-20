/**
 Representa la clase Morning que es heredada de Stage
 en la que se establece el background 1
 */
class Morning extends Stage {

  /** Constructor por defecto */
  public Morning() {
    sprite = loadImage("data/Image/Sprite/Background/Png/BackgroundModelV1.png");
    this.position = new PVector(0, 0);
    posXframe=0;
    posYframe=0;
    widthFrame=700;
    heightFrame=700;
  }

  //---Zona de metodos-------//

  /**Se Dibuja la imagen en el background*/
  public void display() {
    PImage mapFrameMorning=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
    image(mapFrameMorning, position.x, position.y);
  }
}
