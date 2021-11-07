/**
 Representa la clase Enemy que hereda los atributos
 de FrameObject
 */
class Enemy extends FrameObject {

  public int option=1;//(int)random(1,5);
  /**Representa la velocidad de los enemgios*/
  protected PVector velocity;
  /**Representa el tipo de numero de los enemigos*/
  protected Integer rank=1;
  /**Representa el nivel del daño provocado al jugador*/
  protected Integer damageLevel;
  
  

  /** Constructor por defecto */
  public Enemy() {
    this.velocity=new PVector(3,3);
    this.position=new PVector();
  }

  //---Zona de metodos-------//


  //dibujo de los enemigos
 public void display(){
   //imageMode(CENTER);
   image(this.sprite,position.x,position.y,48,48);
 }

  /**movimientos de los enemgios*/
  public void moveToCenter() {
    switch(getOption()) {
    case 1:
      position.y=position.y+velocity.y;//DOWN
      break;
    case 2:
      position.x=position.x+velocity.x;//LEFT  
      break;
    case 3:
      position.x=position.x-velocity.x;//RIGHT
      break;
    case 4:
      position.y=position.y-velocity.y;//UP
      break;
    }
  }

  /**ejecuta el ataque dl jugador*/
  public void  attackPlayer() {
    //Aqui va el codigo de colison de los enemigos con el personaje
  }
  
  

  //---Zona de metodos Accesores-------//
  
  /** Modifica el valor del atributo option */
  public void setOption(int option) {
    this.option=option;
  }
  /** Obtenemos la variable option */
  public int getOption(){
    return this.option;
  }
  
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
