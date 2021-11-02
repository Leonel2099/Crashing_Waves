/**
 Representa la clase Enemy que hereda los atributos
 de FrameObject
 */
class Enemy extends FrameObject {


  /**Representa la velocidad de los enemgios*/
  protected PVector velocity;
  /**Representa el tipo de numero de los enemigos*/
  protected Integer rank;
  /**Representa el nivel del daño provocado al jugador*/
  protected Integer damageLevel;

  /** Constructor por defecto */
  public Enemy() {
  }

  //---Zona de metodos-------//


  //dibujo de los enemigos
  public void display() {
    //Aqui va el codigo donde se dibuja los enemigos
  }

  /**movimientos de los enemgios*/
  public void moveToCenter() {
    //Aqui va el codigo para que se muevan los enemigos
  }

  /**ejecuta el ataque dl jugador*/
  public void  attackPlayer() {
    //Aqui va el codigo de colison de los enemigos con el personaje
  }

  //---Zona de metodos Accesores-------//

  /** Modifica el valor del atributo velocidad */
  public void setVelocity(PVector velocity) {
    this.velocity=velocity;
  }
  /** Obtenemos la variable velocidad */
  public PVector getVelocity() {
    return this.velocity;
  }
  /** Modifica el valor del atributo de rango del enemigo */
  public void setRank(Integer rank) {
    this.rank=rank;
  }
  /** Obtenemos la variable de rango del enemigo */
  public Integer getRank() {
    return this.rank;
  }
  /** Modifica el valor del atributo nivel de daño */
  public void setDamageLevel(Integer damageLevel) {
    this.damageLevel=damageLevel;
  }
  /** Obtenemos la variable nivel de daño */
  public Integer getDamageLevel() {
    return this.damageLevel;
  }
}
