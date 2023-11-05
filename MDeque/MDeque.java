package project3;
import java.util.Iterator;
import java.lang.Iterable;
import java.util.NoSuchElementException;
/* *
* This class provides implementation for MDeque and all of its methods.
*
* 
*/
public class MDeque<E> implements Iterable<E>
{
    public MDeque()
    {
    }

    /**
     * Private node class created to create a doubly liked list out of the mdeque and store Data.
     *
     */
    private class Node
    {
        public E Data;
        public Node next;
        public Node prev;

        /**
         * Creates a new Node with a value of Data.
         *
         * @param Data Data to be set.
         */
        public Node(E Data)
        {
            this.Data = Data;
        }
    }
    private  int size = 0;
    private Node head = null;
    private Node tail =null ;
    private Node middle = null;
    /**
     * Inserts the specified item at the back of this mdeque.
     *
     * Moves reference middle to new reference if needed.
     *
     * @param val value to be added to the back.
     *
     * @throws IllegalArgumentException if value is equal to null.
     */
    public void pushBack(E val)
    {
        if (val == null)
        {
            throw new IllegalArgumentException();
        }
        Node n = new Node(val);
        if(size<1)
        {
            head = n;
            tail = n;
            middle = n;
            head.prev = null;
            tail.next = null;
            size++;
        }
        else
        {
            tail.next = n;
            n.prev = tail;
            tail = n;
            tail.next = null;
            size++;
            int mid = size/2;
            if(mid==((double)size)/2)
            {
                middle = middle.next;
            }
        }
    }
    /**
     * Inserts the specified item at the front of this mdeque.
     *
     * Moves reference middle to new reference if needed.
     *
     * @param val value to be added to the front.
     *
     * @throws IllegalArgumentException if value is equal to null.
     */
    public void pushFront(E val)
    {
        if (val == null)
        {
            throw new IllegalArgumentException();
        }
        Node n = new Node(val);
        if(size<1)
        {
            head = n;
            tail = n;
            middle = n;
            head.prev = null;
            tail.next = null;
            size++;
        }
        else
        {
            head.prev = n;
            n.next = head;
            head = n;
            head.prev = null;
            size++;
            int mid = size/2;
            if(!(mid==((double)size)/2))
            {
                middle = middle.prev;
            }
        }
    }
    /**
     * Inserts the specified item at the middle of this mdeque.
     *
     * @param val value to be added to the middle reference.
     *
     * @throws IllegalArgumentException if value is equal to null.
     */
    public void pushMiddle(E val)
    {
        if (val == null)
        {
            throw new IllegalArgumentException();
        }
        Node n = new Node(val);
        if(size <1)
        {
            head = n;
            tail = n;
            middle = n;
            head.prev = null;
            tail.next = null;
            size++;
        }
        else if(size ==1)
        {
            tail = n;
            middle = n;
            tail.prev = head;
            head.next = tail;
            tail.next = null;
            size++;
        }
        else
        {
            size++;
            int mid = size/2;
            if(!(mid==((double)size)/2))
            {
                Node newprevious = middle.prev;
                Node  newnext= middle;
                middle = n;
                newprevious.next = middle;
                middle.prev = newprevious;
                newnext.prev = middle;
                middle.next = newnext;
            }
            else
            {
                Node newnext=  middle.next;
                Node newprevious = middle;
                middle = n;
                newprevious.next = middle;
                middle.prev = newprevious;
                newnext.prev = middle;
                middle.next = newnext;
            }
        }
    }

    /**
     * Returns an iterator of the mdeque of type E.
     *
     * @param <E> Object type.
     */
    private class Forward<E> implements Iterator
    {
        Node itr = null;

        /**
         * Determines where iterator starts.
         *
         * @param head head to be the starting point of the iterator.
         */
        Forward(Node head)
        {
            itr = head;
        }

        /**
         * Determines if there is another node to iterate on.
         *
         * @return false if Node is null, return true otherwise.
         */
        public boolean hasNext()
        {
           if(itr == null)
           {
               return false;
           }
           return true;
        }

        /**
         * Iterates to next node and returns the data stored if node is not null.
         *
         * @return Data of the current node.
         *
         * @throws NoSuchElementException if current node is equal to null.
         */
        public E next()
        {
            if(this.hasNext())
            {
                E Data = (E)itr.Data;
                itr = itr.next;
                return Data;
            }
            else
            {
                throw new NoSuchElementException();
            }
        }

    }
    /**
     * Returns a backwards iterator of a mdeque of type E.
     *
     * @param <E> Object type.
     */
    private class Backward<E> implements Iterator
    {
        Node itr = null;
        /**
         * Determines where iterator starts (in the back).
         *
         * @param tail tail to be the starting point of the iterator.
         */
        Backward(Node tail)
        {
            itr = tail;
        }
        /**
         * Determines if there is another node to iterate on.
         *
         * @return false if Node is null, return true otherwise.
         */
        public boolean hasNext()
        {
            if(itr == null)
            {
                return false;
            }
            return true;
        }
        /**
         * Iterates to previous node and returns the data stored if node is not null.
         *
         * @return Data of the current node.
         *
         * @throws NoSuchElementException if current node is equal to null.
         */
        public E next()
        {
            if(this.hasNext())
            {
                E Data = (E)itr.Data;
                itr = itr.prev;
                return Data;
            }
            else
            {
                throw new NoSuchElementException();
            }
        }

    }

    /**
     * Returns an iterator over the elements in this mdeque in proper sequence.
     *
     * @return forward iterator.
     */
    public Iterator<E> iterator()
    {
        return new Forward(this.head);
    }
    /**
     * Returns an iterator over the elements in this mdeque in reverse sequential order.
     *
     * @return backward iterator.
     */
    public Iterator<E> reverseIterator()
    {
        return new Backward(this.tail);
    }

    /**
     *Retrieves the back element of this mdeque.
     *
     * @return null if the node is null, else return the element at the back.
     */
    public E peekBack()
    {
        if(tail == null)
        {
            return null;
        }
        return tail.Data;
    }
    /**
     *Retrieves the front element of this mdeque.
     *
     * @return null if the node is null, else return the element at the front.
     */
    public E peekFront()
    {
        if(head == null)
        {
            return null;
        }
        return head.Data;
    }
    /**
     *Retrieves the middle element of this mdeque.
     *
     * @return null if the node is null, else return the element at the middle.
     */
    public E peekMiddle()
    {
        if(middle == null)
        {
            return null;
        }
        return middle.Data;
    }

    /**
     * Retrieves and removes the back element of this mdeque.
     *
     * @return the back of this mdeque, or null if this mdeque is empty.
     */
    public E popBack()
    {
        if(size==0)
        {
            return null;
        }
        else if(size == 1)
        {
            Node popped = tail;
            tail = null;
            middle = null;
            head = null;
            size--;
            return popped.Data;
        }
        else
        {
            Node popped = tail;
            tail = tail.prev;
            tail.next = null;
            size--;
            int mid = size / 2;
            if (!(mid == ((double) size) / 2))
            {
                middle = middle.prev;
            }

            return popped.Data;
        }
    }
    /**
     * Retrieves and removes the front element of this mdeque.
     *
     * @return the front of this mdeque, or null if this mdeque is empty.
     */
    public E popFront()
    {
        if(size == 0)
        {
            return null;
        }
        else if(size == 1)
        {
            Node popped = head;
            head = null;
            tail = null;
            middle = null;
            size--;
            return popped.Data;
        }
        else
        {
            Node popped = head;
            head = head.next;
            head.prev = null;
            size--;
            int mid = size / 2;
            if ((mid == ((double) size) / 2))
            {
                middle = middle.next;
            }
            return popped.Data;
        }
    }
    /**
     * Retrieves and removes the middle element of this mdeque.
     *
     * @return the middle of this mdeque, or null if this mdeque is empty.
     */
    public E popMiddle()
    {
        if(size ==0)
        {
            return null;
        }
        else if(size == 1)
        {
            Node popped = middle;
            middle = null;
            head = null;
            tail = null;
            size--;
            return popped.Data;
        }
        else if(size ==2)
        {
            size--;
            Node popped = middle;
            middle = head;
            tail = head;
            head.next = null;
            return popped.Data;
        }
        else
        {
            size--;
            int mid = size / 2;
            Node popped = middle;
            if (mid == ((double) size) / 2)
            {
                Node newprevious = middle.prev;
                Node newnext = middle.next;
                middle = newnext;
                middle.prev = newprevious;
                newprevious.next = middle;
            }
            else
            {
                Node newnext = middle.next;
                Node newprevious = middle.prev;
                middle = newprevious;
                middle.next = newnext;
                newnext.prev = middle;
            }
            return popped.Data;
        }
    }

    /**
     * Returns the number of elements in this mdeque.
     *
     * @return size of the mdeque
     */
    public int size()
    {
        return size;
    }

    /**
     * Returns a string representation of this mdeque.
     * The string representation consists of a list of the collection's elements
     * in the order they are returned by its iterator, enclosed in square brackets ("[]").
     * Adjacent elements are separated by the characters ", " (comma and space).
     *
     * @return string representation of all node values in the mdeque.
     */
    public String toString()
    {
        if (head == null)
        {
            return "[]";
        }
        else
        {
            Node current = head;
            return "["+assist(current);
        }
    }

    /**
     * Recursive method that starts from the first node of the mdeque and returns the string representation of each node, separated by commas.
     *
     * @param current starts from current, or the head of the mdeque.
     *
     * @return All string values of each node of the mdeque.
     */
    private String assist(Node current)
    {
        if(current.next == null)
        {
            return current.Data.toString()+"]";
        }
        else
        {
            Node thecurrent = current;
            current = current.next;
            return thecurrent.Data+", "+assist(current);
        }
    }




}
