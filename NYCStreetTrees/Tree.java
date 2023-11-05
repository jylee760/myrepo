package project2;

import java.lang.Integer;
public class Tree implements Comparable<Tree>{
    private int tree_id;
    private TreeSpecies speciesnative;
    private String status;
    private String health;
    private String spc_latin;
    private String spc_common;
    private int zipcode;
    private String boroname;
    private double x_sp;
    private double y_sp;
    public Tree(int treeID, TreeSpecies species)
    {
        //treeid must be valid
        if(treeID<0)
        {
            throw new IllegalArgumentException("project2.Tree id must be a non negative integer.");
        }
        else if(species == null)
        {
            throw new IllegalArgumentException("Species must not be null.");
        }
        else
        {
            tree_id = treeID;
            speciesnative = species;
        }
    }
    public void setTreeId(int treeID)
    {
      if(treeID<0)
      {
          throw new IllegalArgumentException("project2.Tree id must be a non negative integer.");
      }
      else
      {
          tree_id = treeID;
      }
    }
    public void setTreeSpecies(TreeSpecies species)
    {
        if(species == null)
        {
            throw new IllegalArgumentException("Species must not be null.");
        }
        else
        {
            speciesnative = species;
        }
    }
    public int getTreeId()
    {
        return tree_id;
    }
    public TreeSpecies getTreeSpecies()
    {
        return speciesnative;
    }
    //overridden equals method, returns true if both have the same tree species (common and latin names) and treeid
    @Override
    public boolean equals(Object obj)
    {
        Tree species = (Tree)obj;
      if(this.getTreeSpecies().equals(species.getTreeSpecies())&&(this.getTreeId()==species.getTreeId()))
        {
         return true;
        }
      return false;
    }
    //overridden compareto method, returns 1 if the common name of the method argument is smaller, and -1 if it is larger.
    //if the common names are the same, compare treeids, return 0 if both the treeid and common name are the same
@Override
    public int compareTo(Tree other)
    {
        int size = Integer.min(this.getTreeSpecies().getCommon().length(),other.getTreeSpecies().getCommon().length());
            for (int i = 0; i < size; i++) {
                if (this.getTreeSpecies().getCommon().charAt(i) > other.getTreeSpecies().getCommon().charAt(i)) {
                    return 1;
                } else if (this.getTreeSpecies().getCommon().charAt(i) < other.getTreeSpecies().getCommon().charAt(i)) {
                    return -1;
                }
            }
            if(this.getTreeSpecies().getCommon().length() == other.getTreeSpecies().getCommon().length())
            {
             if(this.getTreeId()>other.getTreeId())
             {
                 return 1;
             }
             else if(this.getTreeId()<other.getTreeId())
             {
                 return -1;
             }
             else {
                 return 0;
             }
            }
            else if(this.getTreeSpecies().getCommon().length()>other.getTreeSpecies().getCommon().length())
            {
                return 1;
            }
            else
            {
                return -1;
            }
    }
    //tostring method that returns the common name, latin name, and tree id
    @Override
    public String toString()
    {
        return this.getTreeSpecies().getCommon()+ ", " + this.getTreeSpecies().getLatin() + ", " + this.getTreeId();
    }
    public void setStatus(String status1) throws IllegalArgumentException
    {
        if(status1.equals("")||status1.equals(null))
        {
            status = status1;
        }
        else
        {
            if(status1.length()<2)
            {
                throw new IllegalArgumentException("status value is invalid.");
            }
            else {
                String temp = status1.substring(0, 1).toUpperCase() + status1.substring(1).toLowerCase();
                if (!(temp.equals("Alive") || temp.equals("Dead") || temp.equals("Stump"))) {
                    throw new IllegalArgumentException("status value is invalid.");
                } else {
                    status = temp;
                }
            }
        }

    }
    public String getStatus()
    {
        return status;
    }
    public void setHealth(String health1) throws IllegalArgumentException
    {
        if(health1.equals("")||health1.equals(null))
        {
            health = health1;
        }
        else
        {
            if(health1.length()<2)
            {
                throw new IllegalArgumentException("health value is invalid.");
            }
            else {
                String temp = health1.substring(0, 1).toUpperCase() + health1.substring(1).toLowerCase();
                if (!(temp.equals("Good") || temp.equals("Fair") || temp.equals("Poor"))) {
                    throw new IllegalArgumentException("health value is invalid.");
                } else {
                    health = temp;
                }
            }
        }

    }
    public String getHealth()
    {
        return health;
    }
    public void setSpc_latin(String spcLatin)
    {
        if(spcLatin==null)
        {
            throw new IllegalArgumentException("Latin name cannot be null");
        }
        else
        {
            spc_latin = spcLatin;
        }
    }
    public String getSpc_latin()
    {
        return spc_latin;
    }
    public void setSpc_common(String spcCommon)
    {
        if(spcCommon==null)
        {
            throw new IllegalArgumentException("Common name cannot be null");
        }
        else
        {
            spc_common = spcCommon;
        }
    }
    public String getSpc_common()
    {
        return spc_common;
    }
    public void setZipcode(int zipCode) throws IllegalArgumentException
    {
        if(zipCode > -1 && zipCode<100000)
        {
            zipcode = zipCode;
        }
        else
        {
            throw new IllegalArgumentException("Enter a proper zipcode.");
        }
    }
    public int getZipcode()
    {
        return zipcode;
    }
    public void setBoroname(String Boroname) throws IllegalArgumentException
    {
        if(Boroname.length()<2)
        {

           throw new IllegalArgumentException("Invalid name.");
        }
        else
        {
            String temp = Boroname;
            if(!(temp.equalsIgnoreCase("Manhattan")||temp.equalsIgnoreCase("Bronx")||temp.equalsIgnoreCase("Brooklyn")||temp.equalsIgnoreCase("Queens")||temp.equalsIgnoreCase("Staten island")))
            {
                throw new IllegalArgumentException("invalid name");
            }
            else
            {
                temp = Boroname.substring(0,1).toUpperCase() + Boroname.substring(1).toLowerCase();
                boroname = temp;
            }
        }
    }
    public String getBoroname()
    {
        return boroname;
    }
    public void setX_sp(double X_sp)
    {
        x_sp = X_sp;
    }
    public double getX_sp()
    {
        return x_sp;
    }
    public void setY_sp(double Y_sp)
    {
        y_sp = Y_sp;
    }
    public double getY_sp()
    {
        return y_sp;
    }
}