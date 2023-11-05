package project4;
import java.lang.Comparable;
import java.util.ArrayList;

/**
 *This class provides implementation for RestStop and all of its methods as well as its inherited method Comparable
 * 
 */
public class RestStop implements Comparable<RestStop>{
    private String label;
    private ArrayList<String> supplies;
    private ArrayList<String> obstacles;

    /**
     * Creates a new RestStop Object
     * @param label Name of the RestStop
     * @param Supplies String ArrayList of Supplies at the RestStop
     * @param Obstacles String ArrayList of Obstacles at the RestStop
     */
    public RestStop(String label, ArrayList<String> Supplies, ArrayList<String> Obstacles)
    {
        this.label = label;
        this.supplies = Supplies;
        this.obstacles = Obstacles;
    }

    /**
     * Setter for the name
     * @param label
     */
    public void setLabel(String label)
    {
        this.label = label;
    }

    /**
     * Setter for supplies
     * @param Supplies
     */
    public void setSupplies(ArrayList<String> Supplies)
    {
        this.supplies = Supplies;
    }

    /**
     * Setter for obstacles
     * @param Obstacles
     */
    public void setObstacles(ArrayList<String> Obstacles)
    {
        this.obstacles = Obstacles;
    }

    /**
     * getter for name
     * @return label
     */
    public String getLabel()
    {
        return label;
    }

    /**
     * getter for supplies
     * @return supplies
     */
    public ArrayList<String> getSupplies()
    {
        return supplies;
    }

    /**
     * getter for obstacles
     * @return obstacles
     */
    public ArrayList<String> getObstacles()
    {
        return obstacles;
    }

    /**
     *Compares two RestStop objects based off of their names lexicographically
     * @Overrides compareTo
     * @param o the object to be compared.
     * @return 1 if this is larger, -1 if the compared object is larger, and 0 if they are the same size
     */
    @Override
    public int compareTo(RestStop o){
        String comp = (o).getLabel();
        if(this.getLabel().compareTo(comp)<0)
        {
            return -1;
        }
        else if(this.getLabel().compareTo(comp)>0)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }

    /**
     * @Overrides toString
     * @return label, name of the RestStop
     */
    public String toString()
    {
        return label;
    }
}

