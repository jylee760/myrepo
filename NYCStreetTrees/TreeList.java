package project2;


public class TreeList{
    //private node class to create a singly linked list of all tree objects

        private class Node {
            public Tree data;
            public Node next;

            public Node(Tree data) {
                this.data = data;
                this.next = null;
            }
        }
        private Node head;
        private Node tail;
        //size keeps track of the number of elements in the linked list
        private int size = 0;
//default constructor, set head and tail equal to null
    public TreeList()
        {
            head = null;
            tail = null;
        }

        public void add (Tree tree)
        {
            if (tree == null) {
                throw new IllegalArgumentException("No Null values accepted.");
            }
            Node n = new Node(tree);
            //if size of the linked list is zero, head and tail point towards the same node
            if (size == 0) {
                head = n;
                tail = n;
            }
            //if the linked list is not empty, else statement to add to the end of the array
            else
            {
                tail.next = n;
                tail = tail.next;
            }
            //increment size
            size++;
        }
        public int getTotalNumberOfTrees ()
        {
            return size;
        }
        public int getCountByCommonName (String speciesName)
        {
            //iterate through the entire linked list to find tree objects that share the same common name as the method argument
            //increment counter to return the total number of these found tree objects
            int counter = 0;
            Node species = head;
            do {
                if (species.data.getTreeSpecies().getCommon().equalsIgnoreCase(speciesName)) {
                    counter++;
                }
                species = species.next;


            }
            while (species!=null);
            return counter;
        }
        public int getCountByLatinName (String speciesName)
        {
            //same iteration but with latin
            int counter = 0;
            Node species = head;
            do {

                if (species.data.getTreeSpecies().getLatin().equalsIgnoreCase(speciesName)) {
                    counter++;
                }
                species = species.next;

            }
            while (species!=null);
            return counter;
        }
        //same iteration but by borough
        public int getCountByBorough (String boroName)
        {
            int counter = 0;
            Node species = head;
           do {
                if (species.data.getBoroname().equalsIgnoreCase(boroName)) {
                    counter++;
                }
                species = species.next;
            }
           while (species!=null);
            return counter;
        }
        //same iteration but the tree object has to have the same borough and common species name
        public int getCountByCommonNameBorough (String speciesName, String boroName)
        {
            int counter = 0;
            Node species = head;
            do {
                if (species.data.getBoroname().equalsIgnoreCase(boroName) && species.data.getTreeSpecies().getCommon().equalsIgnoreCase(speciesName)) {
                    counter++;
                }

                species = species.next;
            }
            while (species!=null);
            return counter;
        }
        //same iteration as getcountbycommonnameborough but using latin names
        public int getCountByLatinNameBorough (String speciesName, String boroName)
        {
            int counter = 0;
            Node species = head;
            do {

                if (species.data.getBoroname().equalsIgnoreCase(boroName) && species.data.getTreeSpecies().getLatin().equalsIgnoreCase(speciesName)) {
                    counter++;
                }
                species = species.next;
            }while (species!=null);
            return counter;
        }
        //toString method returns all the tree object's common names
    @Override
        public String toString()
        {
            if(size == 1)
            {
                Node n = head;
                return n.data.getSpc_common();
            }
            Node n = head;
            int count = 0;
            String list = "";
            while(n.next!=null) {


                    list += n.data.getSpc_common() + " ";
                    n = n.next;

            }
            return list;
        }
    }

