/**
 Representa la clase Enemy que hereda los atributos
 de FrameObject
 */
class Enemy extends FrameObject {
  
  /**Representa la velocidad de los enemgios*/
  protected int direction;
  /**Representa la velocidad de los enemgios*/
  protected PVector velocity;
  /**Representa el nivel del daño provocado al jugador*/
  protected Integer damageLevel;


  /** Constructor por defecto */
  public Enemy() {
    this.velocity=new PVector(4,4);
  }

  //---Zona de metodos-------//


  /**Dibujo de los enemigos*/
  public void display() {
    image(this.sprite, position.x, position.y, 48, 48);
  }

  /**Movimientos de los enemgios*/
  public void moveToCenter() {
    int time=millis();
    if(time>0&&direction==ConstantList.DOWN_DIRECTION){
      position.y=position.y+velocity.y;//DOWN
    }if(time>4000&&direction==ConstantList.RIGHT_DIRECTION){
      position.x=position.x+velocity.x;//RIGHT
    }if(time>6000&&direction==ConstantList.LEFT_DIRECTION){
      position.x=position.x-velocity.x;//LEFT
    }if(time>8000&&direction==ConstantList.UP_DIRECTION){
      position.y=position.y-velocity.y;//UP
    }
  }
  
  /**Ejecuta los sprite de ataque del enmigo hacia el jugador*/
  public void displayAttackToPlayer(Player player){
    image(this.sprite, position.x, position.y, 48, 48);
  }
  
  /**Este metodo verifica si la colision del enemigo con el jugador es verdadera, si lo es le quita vida y cambia sprite de enemigo*/
  public boolean  attackToPlayer(Player player) {
     if ((this.position.y==player.getPosition().y-46)&&direction==ConstantList.DOWN_DIRECTION) {
      return true;
    }
    if (this.position.x==(player.getPosition().x-46)&&direction==ConstantList.RIGHT_DIRECTION) {
      return true;
    }
    if (this.position.x==(player.getPosition().x+46)&&direction==ConstantList.LEFT_DIRECTION) {
      return true;
    }
    if ((this.position.y==(player.getPosition().y)+46)&&direction==ConstantList.UP_DIRECTION) {
      return true;
    }
    return false;
   }
   
/** Para este metodo realizamos sobreescritura con respecto a su susb clases */   
  public void die(){
    image(this.sprite, position.x, position.y, 48, 48);
  }


  //---Zona de metodos Accesores-------//

  /** Modifica el valor del atributo direction */
  public void setDirection(int direction) {
    this.direction=direction;
  }
   /** Obtenemos la variable direction */
  public int getDirection() {
    return this.direction;
  }

  /** Modifica el valor del atributo velocidad */
  public void setVelocity(PVector velocity) {
    this.velocity=velocity;
  }
  /** Obtenemos la variable velocidad */
  public PVector getVelocity() {
    return this.velocity;
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
