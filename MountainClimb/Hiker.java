package project4;
import java.util.ArrayList;

/**
 * This class provides implementation for the hiker that is hiking down BSTMountain
 * Keeps track of supplies
 * @author John Lee
 */
public class Hiker {
    int[] possesions;

    /**
     * default constructor creates a hiker with zero supplies
     */
    public Hiker()
    {
        possesions = new int[3];
    }

    /**
     * Adds an arraylist of items. If they equal food, raft, or axe the corresponding array element will increment
     * @param Item added to Hiker object
     */
    public void addItem(ArrayList<String> Item)
    {
        for(int g = 0;g<Item.size();g++) {
            if (Item.get(g).equalsIgnoreCase("food")) {
                possesions[0] +=1;
            } else if (Item.get(g).equalsIgnoreCase("raft")) {
                possesions[1] +=1;
            } else {
                possesions[2] +=1;
            }
        }
    }

    /**
     * Adds an individual item
     * @param Item added to hiker object
     */
    public void addIndividual(String Item)
    {
        if(Item.equalsIgnoreCase("food"))
        {
            possesions[0] +=1;
        }
        else if(Item.equalsIgnoreCase("raft"))
        {
            possesions[1] +=1;
        }
        else
        {
            possesions[2]+=1;
        }
    }

    /**
     * removes several items
     * @param Item the ones to be removed from hiker object
     */
    public void removeSeveral(ArrayList<String> Item)
    {
        for(int g = 0;g<Item.size();g++) {
            if (Item.get(g).equalsIgnoreCase("food")) {
                possesions[0] -=1;
            } else if (Item.get(g).equalsIgnoreCase("raft")) {
                possesions[1] -=1;
            } else {
                possesions[2] -=1;
            }
        }
    }

    /**
     * removes a single item from the hiker object
     * @param Item is removed from hiker
     */
    public void removeItem(String Item)
    {
        if(Item.equalsIgnoreCase("food"))
        {
            possesions[0] -=1;
        }
        else if(Item.equalsIgnoreCase("raft"))
        {
            possesions[1] -=1;
        }
        else
        {
            possesions[2]-=1;
        }
    }

    /**
     * clears everything that hiker has, restores base case
     */
    public void clear()
    {
        possesions[0] =0;
        possesions[1] = 0;
        possesions[2] = 0;
    }

    /**
     *
     * @return number of food
     */
    public int getFood()
    {
        return possesions[0];
    }

    /**
     *
     * @return number of rafts
     */
    public int getRaft()
    {
        return possesions[1];
    }

    /**
     *
     * @return number of axes
     */
    public int getAxe()
    {
        return possesions[2];
    }
}
