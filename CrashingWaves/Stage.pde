/**
 Representa la clase Stage en la que se obtiene los distintos escenearios
 (dependindo de cada escenario se generan distintos enemigos)
 */
class Stage extends FrameObject {

  /**Representa la el nivel en el que esta */
  protected Integer level=ConstantList.FIRST_LEVEL;

  /** Representa la lista de enemigos */
  protected ArrayList <Enemy> enemies;


  /** Constructor por defecto */
  public Stage() {
    enemies = new ArrayList<Enemy>();
  }

  public void display() {
    for (int i=0; i<this.enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      enemy.display();
      enemy.moveToCenter();
        if((jugador.isColliding())){
          enemies.remove(i);
        }
    }
  }

  public void addEnemy(Enemy enemy) {
    //Aqui va un codigo para agregar un enemigo a la lista
    int option=enemy.getOption();
    //print(option);
    
    // sincronizar spawn de enemigo mediante el tiempo.
    
    if (enemies.size()<1) {
      if (level==ConstantList.FIRST_LEVEL) {
        //println(goblin.getOption());
        //Goblin goblin = new Goblin(new PVector(this.position.x,this.position.y));
        if (option==1) {
          enemy= new Goblin(new PVector(width/2, -48));//DOWN
          this.enemies.add(enemy);
        } else if (option==2) {
          enemy= new Goblin(new PVector(-48, height/2));//LEFT
          this.enemies.add(enemy);
        } else if (option==3) {
          enemy=new Goblin(new PVector(width, height/2));//RIGTH
          this.enemies.add(enemy);
        } else if (option==4) {
          enemy= new Goblin(new PVector(width/2, height));//UP
          this.enemies.add(enemy);
        }
      }
    }
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
