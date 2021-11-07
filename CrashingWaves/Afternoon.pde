/**
 Representa la clase Afternoon que es heredada de Stage
 en la que se establece el background 2
 */
class Afternoon extends Stage {

  /** Constructor por defecto */
  public Afternoon() {
    sprite = loadImage("data/Image/Sprite/Background/Png/BackgroundModelV1.png");
    this.position = new PVector(width/2, height/2);
    posXframe=700;
    posYframe=0;
    widthFrame=700;
    heightFrame=700;
  }

  //---Zona de metodos-------//

  /**Se Dibuja la imagen en el background*/
  public void display() {
    //Aqui va el codigo donde se inserta la imagen del background
    PImage mapFrameMorning=sprite.get(this.posXframe, this.posYframe, this.widthFrame, this.heightFrame);
    mapFrameMorning.resize(700, 700);
    imageMode(CENTER);
    image(mapFrameMorning, position.x, position.y);
  }
}
