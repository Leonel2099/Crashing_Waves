/**
 Representa la clase Stage en la que se obtiene los distintos escenearios
 (dependindo de cada escenario se generan distintos enemigos)
 */
class Stage extends FrameObject {

  /**Representa la el nivel en el que esta */
  protected Integer level;

  /** Representa la lista de enemigos */
  protected ArrayList <Enemy> enemies;

  /** Constructor por defecto */
  public Stage() {
    enemies = new ArrayList<Enemy>();
  }
  public void display(){
  
  }
  
  public void addEnemy() {
    //Aqui va un codigo para agregar un enemigo a la lista
  }

  public void removeEnemy() {
    //Aqui va un codigo para agregar un enemigo a la lista
  }

  //---Zona de metodos Accesores-------//

  /** Modifica el valor del atributo level */
  public void setLevel(Integer level) {
    this.level=level;
  }
  /** Obtenemos la variable level */
  public Integer getLevel() {
    return this.level;
  }
  public void setEnemies (ArrayList enemies) {
    this.enemies = enemies;
  }
  /** Obtenemos la variable enemies */
  public ArrayList getEnemies() {
    return this.enemies;
  }
}
