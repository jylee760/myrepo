package project4;
import javax.swing.*;
import java.lang.Iterable;
import java.util.*;

/**
 * This class provides implementation of a generic binary search tree as well as all of its methods
 * @param <E> generic parameter that will be in bst form
 * 
 */
public class BST<E extends Comparable<E>> implements Iterable<E> {
    protected Node root;
    private Node first;

    private Node point;
    protected Node last;
    private int size;
    private int[] tempheights = new int[2];

    /**
     *
     * @return right child of the root node
     */
    public E getRightChild()
    {
        return root.right.data;
    }
    /**
     * Protected node class created to create a bst out of type E.
     *
     */
    protected class Node
    {
        E data;
        Node left;
        Node right;

        Node up;
        /**
         * Creates a new Node with a value of Data.
         *
         * @param data Data to be set.
         */
        public Node(E data)
        {
            this.data = data;
        }
    }

    /**
     * @throws NoSuchElementException if the set is empty
     * @return Returns the first (lowest) element currently in this tree.
     */
    public E first()
    {
        if(first == null)
        {
            throw new NoSuchElementException();
        }
        return first.data;
    }

    /**
     * @throws NoSuchElementException if the set is empty
     * @return Returns the last (highest) element currently in this tree.
     */
    public E last()
    {
        return last.data;
    }

    /**
     *
     * @return Returns an iterator over the elements in this tree in ascending order.
     */
    public Iterator<E> iterator()
    {
        return new Ascending(root);
    }
    /**
     * Returns an iterator of the bst of type E.
     *
     * @param <E> Object type.
     */
    private class Ascending<E> implements Iterator
    {

        ArrayList<Node> store = new ArrayList<>();
        int itr = 0;

        /**
         * Starts from the root, will be iterated through recursively
         * @param start
         */
        Ascending(Node start)
        {
            Node root = start;
            if(root!= null)
            {
                ordered(root);
            }

        }

        /**
         * recursive function that adds all nodes to an arraylist in ascending order
         * @param root
         */
        public void ordered(Node root)
        {
            if(root!= null)
            {
                ordered(root.left);
                store.add(root);
                ordered(root.right);
            }
        }

        /**
         * Determines if there is another node to iterate on.
         *
         * @return false if iterator passes the size of the arraylist, return true otherwise.
         */
        public boolean hasNext()
        {
            if(itr>= store.size())
            {
                return false;
            }
            return true;
        }

        /**
         * Iterates to next node and returns the data stored if node is not null.
         *
         * @return Data of the current node, null if there is no next element
         *
         *
         */
        public E next() {
            while(this.hasNext())
            {
                E data = (E)store.get(itr).data;
                itr++;
                return data;
            }
            return null;
        }


    }

    /**
     * Returns an iterator over the elements in this tree in order of the preorder traversal.
     * @return iterator of an arraylist in preorder form
     */
    public Iterator<E> preorderIterator()
    {
        return new preorder(root);
    }

    /**
     * Returns an iterator of the bst of type E in preorder form.
     *
     * @param <E> Object type.
     */
    private class preorder<E> implements Iterator
    {
        ArrayList<Node> store = new ArrayList<Node>();
        int itr = 0;
        /**
         * Starts from the root, will be iterated through recursively
         * @param start
         */
        preorder(Node start)
        {
            Node root = start;
            if(root!= null)
            {
                preordered(root);
            }

        }
        /**
         * recursive function that adds all nodes to an arraylist in preorder form
         * @param root
         */
        public void preordered(Node root)
        {
            if(root!= null)
            {
                store.add(root);
                preordered(root.left);
                preordered(root.right);

            }
        }
        /**
         * Determines if there is another node to iterate on.
         *
         * @return false if iterator passes the size of the arraylist, return true otherwise.
         */
        public boolean hasNext()
        {
            if(itr>= store.size())
            {
                return false;
            }
            return true;
        }

        /**
         * Iterates to next node and returns the data stored if node is not null.
         *
         * @return Data of the current node, null if there is no next element
         *
         *
         */
        public E next() {
            while(this.hasNext())
            {
                E data = (E)store.get(itr).data;
                itr++;
                return data;
            }
            return null;
        }
    }

    /**
     * Returns an iterator over the elements in this tree in order of the postorder traversal.
     * @return iterator over an arraylist sorted by postorder traversal
     */
    public Iterator<E> postorderIterator()
    {
        return new postorder(root);
    }
    /**
     * Returns an iterator of the bst of type E in postorder traversal.
     *
     * @param <E> Object type.
     */
    private class postorder<E> implements Iterator
    {
        ArrayList<Node> store = new ArrayList<Node>();
        int itr = 0;
        /**
         * Starts from the root, will be iterated through recursively
         * @param start
         */
        postorder(Node start)
        {
            Node root = start;
            if(root!= null)
            {
                postordered(root);
            }

        }
        /**
         * recursive function that adds all nodes to an arraylist in postorder form
         * @param root
         */
        public void postordered(Node root)
        {
            if(root!= null)
            {
                postordered(root.left);
                postordered(root.right);
                store.add(root);
            }
        }
        /**
         * Determines if there is another node to iterate on.
         *
         * @return false if iterator passes the size of the arraylist, return true otherwise.
         */
        public boolean hasNext()
        {
            if(itr>= store.size())
            {
                return false;
            }
            return true;
        }
        /**
         * Iterates to next node and returns the data stored if node is not null.
         *
         * @return Data of the current node, null if there is no next element
         *
         *
         */
        public E next() {
            while(this.hasNext())
            {
                E data = (E)store.get(itr).data;
                itr++;
                return data;
            }
            return null;
        }
    }

    /**
     * Constructs a new, empty tree, sorted according to the natural ordering of its elements.
     * default contructor of BST, creates an empty tree
     */
    public BST()
    {
        root = null;
    }

    /**
     * Constructs a new tree containing the elements in the specified collection, sorted according to the natural ordering of its elements.
     * constructor of BST, takes in an argument of type E
     * @param collection to be put into BST via nodes.
     */
    public BST(E[] collection)
    {
        for(int i= 0;i<collection.length;i++)
        {
            this.add(collection[i]);
        }

    }

    /**
     * Finds if there is an element E in the BST
     * @param e
     * @return the node containing that element if it is there, otherwise return null
     */
    public Node find(E e)
    {
        if(root == null)
        {
            return null;
        }
        if(e == null)
        {
            return null;
        }
        return findIt(e, root);
    }

    /**
     * recursive function to help find the element
     * @param data
     * @param root
     * @return the Node that contains the element, or null if it is not found
     */
    private Node findIt(E data, Node root)
    {
        if(root == null)
        {
            return null;
        }
        if(data.compareTo(root.data)>0)
        {
            return findIt(data, root.right);
        }
        else if(data.compareTo(root.data)<0)
        {
            return findIt(data,root.left);
        }
        else if(data.compareTo(root.data) == 0)
        {
            return root;
        }
        return null;
    }

    /**
     * Adds the specified element to this set if it is not already present. More formally, adds the specified element e to this tree if the set contains no element e2 such that Objects.equals(e, e2). If this set already contains the element, the call leaves the set unchanged and returns false.
     * This operation should be O(H).
     * @param e - element to be added to this set
     * @return true if this set did not already contain the specified element
     * @throws NullPointerException - if the specified element is null and this set uses natural ordering, or its comparator does not permit null elements
     */
    public boolean add(E e)
    {
        if(e == null)
        {
            throw new NullPointerException();
        }
        if(root == null)
        {
            root = new Node(e);
            first = root;
            last = root;
            size++;
            tempheights[0] =1;
            tempheights[1] = 1;
            return true;
        }
        boolean ad = add(e,root,tempheights);
        if(tempheights[1]>tempheights[0])
        {
            tempheights[0] = tempheights[1];
        }
        tempheights[1] = 1;
        return ad;
    }

    /**
     * private recursive add class to help in adding elements
     * @param data
     * @param node
     * @param height
     * @return true if the element can be added, false if it is already in the bst
     */
    private boolean add(E data, Node node,int[] height ) {

        if ( node.data.equals(data) ) {
            return false;
        }
        if (data.compareTo(node.data ) < 0 ) {
            if (node.left == null ) {
                node.left = new Node(data);
                size++;
                node.left.up = node;
                if(first.data.compareTo(node.left.data)<0)
                {
                    height[1]+=1;
                    return true;
                }
                else {
                    first = node.left;
                }
                height[1]+=1;
                return true;
            }
            height[1]+=1;
            return add(data, node.left,height) ;
        }
        else {
            if (node.right == null ) {
                node.right = new Node(data);
                size++;
                node.right.up = node;
                if(last.data.compareTo(node.right.data)>0)
                {
                    height[1]+=1;
                    return true;
                }
                else {
                    height[1]+=1;
                    last = node.right;
                }
                return true;
            }
            height[1]+=1;
            return add(data, node.right,height) ;
        }

    }

    /**
     * creates an empty bst
     */
    public void clear()
    {
        size = 0;
        root = null;
    }

    /**
     * Returns true if this set contains the specified element. More formally, returns true if and only if this set contains an element e such that Objects.equals(o, e).
     * This operation should be O(H).
     * @param o - object to be checked for containment in this set
     * @return true if this set contains the specified element
     * @throws NullPointerException - if the specified element is null and this set uses natural ordering, or its comparator does not permit null elements
     * @throws ClassCastException - if the specified object cannot be compared with the elements currently in the set
     */
    public boolean contains(Object o)
    {
        if(o == null)
        {
            throw new NullPointerException();
        }
        try {
            E check = (E) o;
            return containsCheck(root, check);
        }
        catch(Exception e)
        {
            throw new ClassCastException();
        }
    }

    /**
     * private recursive boolean method that helps check if bst contains element E
     * @param check
     * @param compare
     * @return true if it is inside bst, otherwise return false
     */
    private boolean containsCheck(Node check, E compare)
    {
        if(check == null)
        {
            return false;
        }
        if(compare.compareTo(check.data)<0)
        {
            return containsCheck(check.left,compare);
        }
        else if(compare.compareTo(check.data)>0)
        {
            return containsCheck(check.right, compare);
        }
        else
        {
            point = check;
            return true;
        }
    }

    /**
     * Returns the least element in this tree strictly greater than the given element, or null if there is no such element.
     * This operation should be O(H).
     * @param e - the value to match
     * @return the least element greater than e, or null if there is no such element
     * @throws ClassCastException if the specified element cannot be compared with the elements currently in the set
     * @throws NullPointerException if the specified element is null
     */
    public E higher(E e) throws ClassCastException,NullPointerException
    {
        E high = ceiling(e);
        if(high!=null) {
            if (high.compareTo(e) == 0)
            {
                return null;
            }
            else
            {
                return ceiling(e);
            }
        }
        return null;
    }

    /**
     * Returns the least element in this tree greater than or equal to the given element, or null if there is no such element.
     * This operation should be O(H).
     * @param e - the value to match
     * @return the least element greater than or equal to e, or null if there is no such element
     * @throws ClassCastException - if the specified element cannot be compared with the elements currently in the set
     * @throws NullPointerException - if the specified element is null
     */
    public E ceiling(E e) throws ClassCastException
    {
        boolean check = this.contains(e);
        if(!(check))
        {
            return null;
        }
        if(e.compareTo(last.data) == 0)
        {
            return e;
        }
        else
        {
            Iterator itr = iterator();
            while(itr.hasNext())
            {
                if(itr.next() ==e)
                {
                    return (E)itr.next();
                }
            }
            return null;

        }
    }

    /**
     * private recursive call to help ceiling
     * @param start
     * @return Node that is the least element greater than e
     */
    private Node ceilingHelper(Node start)
    {
        if(start.left!= null)
        {
            return ceilingHelper(start.left);
        }
        else
        {
            return start;
        }
    }

    /**
     * Returns the greatest element in this set strictly less than the given element, or null if there is no such element.
     * This operation should be O(H).
     * @param e - the value to match
     * @return the greatest element less than e, or null if there is no such element
     * @throws ClassCastException - if the specified element cannot be compared with the elements currently in the set
     * @throws NullPointerException - if the specified element is null
     */
    public E lower(E e) throws ClassCastException,NullPointerException
    {
        E low = floor(e);
        if(low.compareTo(e) ==0)
        {
            return null;
        }
        else
        {
            return floor(e);
        }
    }

    /**
     * Returns the greatest element in this set less than or equal to the given element, or null if there is no such element.
     * This operation should be O(H).
     * @param e  - the value to match
     * @return the greatest element less than or equal to e, or null if there is no such element
     * @throws ClassCastException - if the specified element cannot be compared with the elements currently in the set
     * @throws NullPointerException - if the specified element is null
     */
    public E floor(E e) throws ClassCastException, NullPointerException
    {
        boolean check = this.contains(e);
        if(!(check))
        {
            return null;
        }
        if(e.compareTo(first.data) == 0)
        {
            return e;
        }
        else if(point.left== null)
        {
            if(point.up.data.compareTo(point.data)<0) {
                return point.up.data;
            }
            else
            {
                return point.up.up.data;
            }
        }
        else
        {
            return floorHelper(point.left).data;

        }
    }

    /**
     * recursive function to help find floor
     * @param start
     * @return greatest element under the element e
     */
    private Node floorHelper(Node start)
    {
        if(start.right!= null)
        {
            return floorHelper(start.right);
        }
        else
        {
            return start;
        }
    }

    /**
     * Returns the height of this tree. The height of a leaf is 1. The height of the tree is the height of its root node.
     * This operation should be O(1)
     * @return the height of this tree or zero if the tree is empty
     */
    public int height()
    {
        if(this == null)
        {
            return 0;
        }
        else
        {
            return tempheights[0];
        }
    }

    /**
     * Returns true if this set contains no elements.
     * This operation should be O(1).
     * @return true if this set contains no elements
     */
    public boolean isEmpty()
    {
        if(this.height() == 0)
        {
            return true;
        }
        return false;
    }

    /**
     * Returns the number of elements in this tree.
     * This operation should be O(1).
     * @return the number of elements in this tree
     */
    public int size()
    {
        return size;
    }

    /**
     * Returns the element at the specified position in this tree. The order of the indexed elements is the same as provided by this tree's iterator. The indexing is zero based (i.e., the smallest element in this tree is at index 0 and the largest one is at index size()-1).
     * This operation should be O(H).
     * @param index - index of the element to return
     * @return the element at the specified position in this tree
     * @throws IndexOutOfBoundsException - if the index is out of range (index < 0 || index >= size())
     */
    public E get(int index)
    {
        Iterator itr = new Ascending(root);
        int count = 0;
        E data = null;
        if(index<0 ||index>=size)
        {
            throw new IndexOutOfBoundsException();
        }
        while(count<index+1)
        {
            data = (E)itr.next();
            count++;
        }
        return data;
    }

    /**
     * Compares the specified object with this tree for equality. Returns true if the given object is also a tree, the two trees have the same size, and every member of the given tree is contained in this tree.
     * This operation should be O(N).
     * @Overrides equals in class Object
     * @param o- object to be compared for equality with this tree
     * @return true if the specified object is equal to this tree
     */
    public boolean equals(Object o)
    {
        BST compared = (BST)o;
        HashSet<E> compA = new HashSet<E>();
        HashSet<E> compB = new HashSet<E>();
        if(this.size() ==compared.size())
        {
            for(int i = 0;i<size;i++) {
                compA.add(this.get(i));
                compB.add((E) compared.get(i));
            }
            return compA.equals(compB);
        }
        else {
            return false;
        }
    }

    /**
     * Removes the specified element from this tree if it is present. More formally, removes an element e such that Objects.equals(o, e), if this tree contains such an element. Returns true if this tree contained the element (or equivalently, if this tree changed as a result of the call). (This tree will not contain the element once the call returns.)
     * This operation should be O(H).
     * @param o - object to be removed from this set, if present
     * @return true if this set contained the specified element
     * @throws ClassCastException - if the specified object cannot be compared with the elements currently in this tree
     * @throws NullPointerException - if the specified element is null
     */
    public boolean remove(Object o)
    {
        try
        {
            E type = (E) o;
        }
        catch(Exception e)
        {
            throw new ClassCastException("Cant");
        }

        if((E) o ==null)
        {
            throw new NullPointerException();
        }
        Node pointed = this.find((E)o);
        if(pointed!=null) {
            if (pointed.data.compareTo(first.data) == 0) {
                if (first.right != null) {
                    first = ceilingHelper(first.right);
                } else {
                    first = first.up;
                }
            }
            if (pointed.data.compareTo(last.data) == 0) {
                if (last.left != null) {
                    last = floorHelper(last.left);
                } else {
                    last = last.up;
                }
            }
            if (pointed != null) {
                if (pointed.left == null && pointed.right == null) {
                    if (pointed.up.right == pointed) {
                        pointed.up.right = null;
                    } else {
                        pointed.up.left = null;
                    }
                } else {
                    if (pointed.left != null && pointed.right != null) {
                        recursionRemove(pointed.left, pointed);
                    } else if (pointed.left == null) {
                        if (pointed.up.left == pointed) {
                            pointed.up.left = pointed.right;
                        } else {
                            pointed.up.right = pointed.right;
                        }
                    } else {
                        if (pointed.up.left == pointed) {
                            pointed.up.left = pointed.left;
                        } else {
                            pointed.up.right = pointed.left;
                        }
                    }
                }
                size--;
                return true;
            }
        }
        return false;
    }

    /**
     * private recursive method to remove a node
     * @param root
     * @param starter
     */
    private void recursionRemove(Node root, Node starter)
    {
        if(root.right!=null)
        {
            recursionRemove(root.right, starter);
        }
        else
        {
            Node replacement = checkLess(root);
            if(replacement!=starter.left.left)
            {
                if(starter.left.left!=null) {
                    starter.left.left.up = replacement;
                }
                root.up.right = replacement;
                replacement.up = root.up.right;
            }
            starter.data = root.data;
        }
    }

    /**
     * private recursive function to return the smallest child of a node
     * @param root
     * @return the node
     */
    private Node checkLess(Node root)
    {
        if(root.left!=null)
        {
            return checkLess(root.left);
        }
        return root;
    }

    /**
     * private recursive function to return the smallest node larger than the element input
     * @param root
     * @return the node
     */
    private Node findNextRoot(Node root)
    {
        if(root.right!=null)
        {
            return findNextRoot(root.right);
        }
        return root;
    }

    /**
     * Returns a string representation of this tree. The string representation consists of a list of the tree's elements in the order they are returned by its iterator (inorder traversal), enclosed in square brackets ("[]"). Adjacent elements are separated by the characters ", " (comma and space). Elements are converted to strings as by String.valueOf(Object).
     * This operation should be O(N).
     * @Overrides toString in class Object
     * @return a string representation of this collection
     */
    public String toString()
    {
        Iterator itr = this.iterator();
        String toStr = "[";
        while(itr.hasNext())
        {
            String connect = String.valueOf(itr.next());
            if(itr.hasNext()) {
                toStr = toStr + connect + ", ";
            }
            else
            {
                toStr = toStr + connect + "]";
            }
        }
        return toStr;
    }

    /**
     * Produces tree like string representation of this tree.
     * Returns a string representation of this tree in a tree-like format.
     * The string representation consists of a tree-like representation of this tree.
     * Each node is shown in its own line with the indentation showing the depth of the node in this tree.
     * The root is printed on the first line, followed by its left subtree, followed by its right subtree.
     * @return string containing tree-like representation of this tree.
     */
    public String toStringTreeFormat()
    {
        StringBuilder sb = new StringBuilder();
        StringBuilder spacing = new StringBuilder("");
        fillOrder(root, "", sb, 0, spacing);
        return sb.toString();
    }

    /**
     * Recursive method that uses stringbuilder to create the toStringTreeFormat
     * @param root
     * @param middle
     * @param sb
     * @param count
     * @param spacing
     */
    private void fillOrder(Node root,String middle, StringBuilder sb, int count, StringBuilder spacing)
    {
        if(root!=null) {
            if (count == 0) {
                sb.append(middle + root.data);
                sb.append("\n");
                middle = "|--";
                count++;
            }
            else if(root.data.compareTo(this.getRightChild())==0)
            {
                spacing.replace(0,spacing.length(),"");
                sb.append(spacing.toString());
                sb.append(middle+root.data);
                sb.append("\n");
                spacing.append("   ");
            }
            else
            {
                sb.append(spacing.toString());
                sb.append(middle + root.data);
                sb.append("\n");
                spacing.append("   ");
                if(root.left ==null)
                {
                    sb.append(spacing.toString());
                    sb.append("|--null");
                    sb.append("\n");
                }
                if(root.right == null)
                {
                    sb.append(spacing.toString());
                    sb.append("|--null");
                    sb.append("\n");
                }
                if(root.right==null&&root.left==null)
                {
                    spacing.replace(0,3, "");
                }
            }

            fillOrder(root.left, middle, sb, count, spacing);
            fillOrder(root.right, middle, sb, count,spacing);
        }
    }

}
