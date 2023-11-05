package project2;

public class TreeSpecies{
    private String common;
    private String latin;

    //treespecies class constructor accepts common and latin name, both cannot be null
    //set both to lowercase for ease of comparison
    public TreeSpecies ( String commonName, String latinName) throws IllegalArgumentException
    {
        if(commonName == null)
        {
            throw new IllegalArgumentException("Common name cannot be a null value.");
        }
        else if(latinName == null)
        {
            throw new IllegalArgumentException("Latin name cannot be a null value.");
        }
        else
        {
            common = commonName.toLowerCase();
            latin  = latinName.toLowerCase();
        }
    }

    public String getCommon()
    {
        return common;
   }
    public String getLatin()
    {
        return latin;
    }
    //overridden equals method that returns true if both treespecies have the same latin and common names
    @Override
    public boolean equals(Object obj)
    {
        TreeSpecies speciestemp = (TreeSpecies) obj;
        if(this.common.equals(speciestemp.common) && this.latin.equals(speciestemp.latin))
        {
            return true;
        }
        return false;
    }
}