package project2;

import java.util.ArrayList;
public class TreeSpeciesList extends ArrayList<TreeSpecies> {

    public TreeSpeciesList()
    {
    }
    //as this class is an arraylist, "this" is the entire treespecieslist that is created to keep track of all treespecies. Extends ArrayList, so methods are inherited.
    public TreeSpeciesList getByCommonName(String keyword)
    {
        //tracker is the counter that returns the number of tree species that share a common name with the keyword.
        int tracker = 0;
        if(keyword==null)
        {
            throw new IllegalArgumentException("Argument cannot be null.");
        }
        //create a tree species list that returns the number of tree species that have a common name with the keyword in them.
        TreeSpeciesList commonlist = new TreeSpeciesList();
        for(int i = 0;i<this.size();i++)
             if(this.get(i).getCommon().indexOf(keyword.toLowerCase())!=-1)
            {
                commonlist.add(this.get(i));
                tracker++;
            }
        //if tracker equals 0, there are no tree species in common with the keyword, so return null
        if(tracker ==0)
        {
            return null;
        }
        else {
            return commonlist;
        }
    }
    public TreeSpeciesList getByLatinName(String keyword)
    {
        //same implementation as getbycommonname, but with latin.
        int tracker = 0;
        if(keyword==null)
        {
            throw new IllegalArgumentException("Argument cannot be null.");
        }
        TreeSpeciesList Latinlist = new TreeSpeciesList();
        for(int i = 0;i<this.size();i++)
        {
            if(this.get(i).getLatin().indexOf(keyword.toLowerCase())!=-1)
            {
                Latinlist.add(this.get(i));
                tracker++;
            }
        }
        if(tracker ==0)
        {
            return null;
        }
        else {
            return Latinlist;
        }
    }

}
