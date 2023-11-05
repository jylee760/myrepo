package project4;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * This class provides implementation of a binary search tree class of type RestStop
 * @param <RestStop>
 * 
 */
public class BSTMountain<RestStop> extends BST {
    Iterator itr;
    int size = height();
    ArrayList<String> Paths = new ArrayList<String>();
    ArrayList<String> tempRemoved = new ArrayList<String>();
    ArrayList<Node> prevTraversal = new ArrayList<>();
    Node prevNode = root;

    /**
     * creates a BST of type RestStop
     * @param rest
     */
    public BSTMountain(RestStop[] rest) {
        super((Comparable[]) rest);
    }

    /**
     *
     * @return all paths that lead down the BSTMountain
     */
    public ArrayList<String> traverse()
    {
        itr = preorderIterator();
        project4.RestStop first = (project4.RestStop)itr.next();
        Hiker hiker = new Hiker();
        hiker.addItem(first.getSupplies());
        Node current = root;
        StringBuilder sb = new StringBuilder("");
        return determinePath(current,hiker,sb,0,prevTraversal);
    }
    int[] times = {1};

    /**
     * Recursive function that iterates through the nodes in preorder form to find valid paths
     * @param curr
     * @param hiker
     * @param sb
     * @param a
     * @param prevTraversal
     * @return  valid paths
     */
    private ArrayList<String> determinePath(Node curr,Hiker hiker,StringBuilder sb,int a,ArrayList<Node> prevTraversal)
    {
        if(prevTraversal.contains(last)||prevTraversal.contains(root.right))
        {
            return Paths;
        }
        if(root.left!=null && prevTraversal.contains(root.left)&&curr == root)
        {
            sb.replace(0,sb.length(),"");
            sb.append(curr.data.toString() + " ");
            a = 1;
            hiker.clear();
            hiker.addItem(((project4.RestStop)curr.data).getSupplies());
            checkValid(curr.right,hiker,sb,a);
            return determinePath(curr.right,hiker,sb,a,prevTraversal);
        }
        if(curr!= null)
        {
            if((!(prevTraversal.contains(curr.left)))&&checkValid(curr.left,hiker,sb,a)) {
                sb.append(curr.data.toString() + " ");
                a++;
                return determinePath(curr.left, hiker, sb, a, prevTraversal);
            }
            else if((!(prevTraversal.contains(curr.right)))&&checkValid(curr.right,hiker,sb,a))
            {
                sb.append(curr.data.toString()+" ");
                a++;
                return determinePath(curr.right,hiker,sb,a,prevTraversal);
            }
            else
            {
                prevTraversal.add(curr);
                sb.replace(sb.length()-2,sb.length(),"");

                if(hiker.getFood()<0)
                {
                    hiker.addIndividual("food");
                }
                else {
                    hiker.addItem(tempRemoved);
                }
                a--;
                return determinePath(curr.up,hiker,sb,a,prevTraversal);
            }
        }
        Paths.add(String.valueOf(sb.replace(sb.length()-1,sb.length()," ")));
        prevTraversal.add(prevNode);
        Node retraverse;
        if(prevNode == root) {
            retraverse = root;
        }
        else
        {
            retraverse = checkNode(prevNode.up, times);
        }
        sb.replace(sb.length()-(2*(times[0]+1)),sb.length(),"");
        hiker = restore(root,retraverse);
        for(int i = 0;i<a-(times[0]+1);i++)
        {
            hiker.removeItem("food");
        }
        a=a-(times[0]+1);
        times[0] = 1;
        return determinePath(retraverse,hiker,sb,a,prevTraversal);
    }

    /**
     * Brings the hiker object back to a path that has not been traversed
     * @param root
     * @param current
     * @return this hiker object
     */
    private Hiker restore(Node root,Node current)
    {
        Hiker h = new Hiker();
        restoreHelp(root,current,h);
        return h;
    }

    /**
     * recursive function to restore the supplies that hiker has
     * @param root
     * @param current
     * @param h
     */
    private void restoreHelp(Node root,Node current,Hiker h)
    {
        if(root.data.compareTo(current.data)>0)
        {
            h.addItem(((project4.RestStop)root.data).getSupplies());
            ArrayList<String> obs = ((project4.RestStop)root.data).getObstacles();
            for(int i = 0;i<obs.size();i++)
            {
                if(obs.get(i).equalsIgnoreCase("river"))
                {
                    h.removeItem("raft");
                }
                else if(obs.get(i).equalsIgnoreCase("fallen tree"))
                {
                    h.removeItem("axe");
                }
            }
            restoreHelp(root.left,current,h);
        }
        else if(root.data.compareTo(current.data)<0)
        {
            h.addItem(((project4.RestStop)root.data).getSupplies());
            ArrayList<String> obs = ((project4.RestStop)root.data).getObstacles();
            for(int i = 0;i<obs.size();i++)
            {
                if(obs.get(i).equalsIgnoreCase("river"))
                {
                    h.removeItem("raft");
                }
                else if(obs.get(i).equalsIgnoreCase("fallen tree"))
                {
                    h.removeItem("axe");
                }
            }

            restoreHelp(root.right,current,h);
        }
        else
        {
            h.addItem(((project4.RestStop)root.data).getSupplies());
            ArrayList<String> obs = ((project4.RestStop)root.data).getObstacles();
            for(int i = 0;i<obs.size();i++)
            {
                if(obs.get(i).equalsIgnoreCase("river"))
                {
                    h.removeItem("raft");
                }
                else if(obs.get(i).equalsIgnoreCase("fallen tree"))
                {
                    h.removeItem("axe");
                }
            }
        }

    }

    /**
     * checks if the current node has been traversed, or if it is the root.
     * @param curr
     * @param count
     * @return a node that has not been traversed
     */
    private Node checkNode(Node curr,int[] count)
    {
        if(curr.up ==null)
        {
            return root;
        }
        if(curr.left ==null&&prevTraversal.contains(curr.right))
        {
            count[0]+=1;
            prevTraversal.add(curr);
            return checkNode(curr.up,count);
        }
        else if(prevTraversal.contains(curr.left)&&curr.right==null)
        {
            count[0]+=1;
            prevTraversal.add(curr);
            return checkNode(curr.up,count);
        }
        else if(prevTraversal.contains(curr.left)&&prevTraversal.contains(curr.right))
        {
            count[0]+=1;
            prevTraversal.add(curr);
            return checkNode(curr.up,count);
        }
        return curr;
    }

    /**
     * checks if the RestStop is reachable/a valid path
     * @param root
     * @param hiker
     * @param sb
     * @param a
     * @returns true if it is, false if it is not
     */
    private boolean checkValid(Node root,Hiker hiker,StringBuilder sb,int a) {
        if (root == null && a ==size-1) {
            return true;
        }
        else if(root==null && a!=size-1)
        {
            return false;
        }
        else {
            prevNode = root;
            ArrayList<String> toRemove = new ArrayList<String>();
            hiker.removeItem("food");
            project4.RestStop as = (project4.RestStop) root.data;
            hiker.addItem(as.getSupplies());
            if (hiker.getFood() < 0) {
                return false;
            } else {
                ArrayList<String> obs = as.getObstacles();
                for (int i = 0; i < obs.size(); i++) {
                    if (obs.get(i).equals("river")) {
                        if (hiker.getRaft() > 0) {
                            toRemove.add("raft");
                        } else {
                            hiker.addIndividual("food");
                            hiker.removeSeveral(as.getSupplies());
                            return false;
                        }
                    } else if (obs.get(i).equals("fallen tree")) {
                        if (hiker.getAxe() > 0) {
                            hiker.addIndividual("food");
                            hiker.removeSeveral(as.getSupplies());
                            toRemove.add("axe");
                        } else {
                            hiker.addIndividual("food");
                            return false;
                        }
                    }
                }
                hiker.removeSeveral(toRemove);
                toRemove.add("food");
                tempRemoved = toRemove;
                return true;
            }
        }
    }
}
