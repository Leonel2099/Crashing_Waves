/**
 Representa la clase Afternoon que es heredada de Stage
 en la que se establece el background 2
 */
class Afternoon extends Stage {

  /** Constructor por defecto */
  public Afternoon() {
    sprite = loadImage("data/Image/Sprite/Background/Png/BackgroundModelV1.png");
    this.position = new PVector(0,0);
    posXframe=700;
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
