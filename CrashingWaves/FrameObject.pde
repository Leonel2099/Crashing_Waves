/**
 Representa la clase FrameObject que hereda los atributos
 de GameObject
 */
abstract class FrameObject extends GameObject {
  /**Representa al sprite que usaremos para nuestros objetos*/
  protected PImage sprite;
  /**Representa la posicion en X en el Asset*/
  protected Integer posXframe;
  /**Representa la posicion en Y en el Asset*/
  protected Integer posYframe;
  /**Representa al ancho del frame que tomaremos del Asset*/
  protected Integer widthFrame;
  /**Representa al alto del frame que tomaremos del Asset*/
  protected Integer heightFrame;

  /** Constructor por defecto */
  public FrameObject(){
  }
  
  //---Zona de metodos-------//
  
  
  abstract public void display();
  
  
  //---Zona de metodos Accesores-------//
  
  
    /** Modifica el valor del atributo sprite */
  public void setSprite(PImage sprite) {
    this.sprite=sprite;
  }
  /** Obtenemos la variable sprite */
  public PImage getSprite() {
    return this.sprite;
  }
    /** Modifica el valor del atributo posicion en x del size del sprite */
  public void setPosXframe(Integer posXframe) {
    this.posXframe=posXframe;
  }
  /** Obtenemos la variable posicion en x del size del sprite */
  public Integer getPosXframe() {
    return this.posXframe;
  }
    /** Modifica el valor del atributo posicion en y del size del sprite */
  public void setPosYframe(Integer posYframe) {
    this.posYframe=posYframe;
  }
  /** Obtenemos la variable posicion en y del size del sprite */
  public Integer getPosYframe() {
    return this.posYframe;
  }
    /** Modifica el valor del atributo ancho del frame */
  public void setWidthFrame(Integer widthFrame) {
    this.widthFrame=widthFrame;
  }
  /** Obtenemos la variable ancho del frame */
  public Integer getWidthFrame() {
    return this.widthFrame;
  }
    /** Modifica el valor del atributo alto del frame */
  public void setHeightFrame(Integer heightFrame) {
    this.heightFrame=heightFrame;
  }
  /** Obtenemos la variable alto del frame */
  public Integer getHeightFrame() {
    return this.heightFrame;
  }
}
