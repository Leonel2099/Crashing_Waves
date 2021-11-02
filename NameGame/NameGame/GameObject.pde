/**
 La clase GameObject es la super clase
 para Enemy,Player y Stage
 */
abstract class GameObject {

  /**Representa la posicion de los objetos de la subclase*/
  protected PVector position;
  /**Representa el ancho de los objetos de la subclase*/
  protected Integer widthGO;
  /**Representa el alto de los objetos de la subclase*/
  protected Integer heightGO;

  //---Zona de metodos Accesores-------//

  /** Modifica el valor del atributo position */
  public void setPosition(PVector position) {
    this.position=position;
  }
  /** Obtenemos la variable position */
  public PVector getPosition() {
    return this.position;
  }
  /** Modifica el valor del atributo widthGO */
  public void setWidthGO(Integer widthGO) {
    this.widthGO=widthGO;
  }
  /** Obtenemos la variable widthGO */
  public Integer getWidthGO() {
    return this.widthGO;
  }
  /** Modifica el valor del atributo heightGO */
  public void setHeightGO(Integer heightGO) {
    this.heightGO=heightGO;
  }
  /** Obtenemos la variable heightGO */
  public Integer getHeightGO() {
    return this.heightGO;
  }
}
