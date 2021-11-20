/**
 Representa la clase Night que es heredada de Stage
 en la que se establece el background 3
 */
class Night extends Stage {

  /** Constructor por defecto */
  public Night() {
    sprite = loadImage("data/Image/Sprite/Background/Png/BackgroundModelV1.png");
    this.position = new PVector(0, 0);
    posXframe=1400;
    posYframe=0;
    widthFrame=700;
    heightFrame=700;
  }
  //---Zona de metodos-------//

  /**Se Dibuja la imagen en el background*/
  public void display() {
    PImage mapFrameNight=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
    image(mapFrameNight, position.x, position.y);
  }
}
