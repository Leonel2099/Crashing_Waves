/**
 Representa la clase Player que hereda los atributos
 de FrameObject
 */
class Player extends FrameObject {

  /**Representa la vida del player*/
  private Integer life;

  /** Constructor por defecto */
  public Player() {
  }

  //---Zona de metodos-------//
  /**Se Dibuja al personaje del juego */
  public void display() {
    //Aqui va el codigo donde se dibuja el personaje principal
  }

  public void attackCircurlarly() {
    //Aqui va un codigo para verificar si hubo colisión en todas las direcciones
  }

  public void attack() {
    //Aqui va un codigo para verificar si hay colisión en una sola direccion
  }
  public void lostLife(){
    //Aqui va un codigo que indica cuanta vida pierde el player por colision
  }

  //---Zona de metodos Accesores-------//

  /** Modifica el valor del atributo life */
  public void setLife(Integer life) {
    this.life = life;
  }
  /** Obtenemos la variable life */
  public Integer getLevel() {
    return this.life;
  }
}
