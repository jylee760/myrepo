package project2;

import java.util.Scanner;
import java.util.ArrayList;
import java.io.*;
import java.lang.Integer;
import java.lang.Double;
public class NYCStreetTrees{
    public static void main(String[] args) {
        //counter for trees
        int totalnumTrees = 0;
        File f;
        Scanner csvScan = null;
        //if the argument length is 0, exit with Usage error message
        //try catch exception if file cannot be used
        //scanning in command line argument
        if (args.length < 1) {
            System.err.println("Usage Error: the program expects file name as an argument.");
            System.exit(0);
        }
        try {
            f = new File(args[0]);
            csvScan = new Scanner(f);
        } catch (FileNotFoundException e) {
            System.err.println("Error: the file " + args[0] + " cannot be opened");
            System.exit(0);
        }

        CSV csv = new CSV(csvScan);
        //Setting Indexes: Treeid = 0, Status = 6, Health = 7, Latin = 8, Common = 9, Zipcode = 25, Borough = 29, X = 39, Y = 40
        //calling csv.getNextRow to skip past the header with all string types
        int treeid = 0;
        int status = 6;
        int health = 7;
        int latin = 8;
        int common = 9;
        int zipcode = 25;
        int borough = 29;
        int xval = 39;
        int yval = 40;
        csv.getNextRow();
        TreeSpeciesList TreeSL = new TreeSpeciesList();
        TreeList treelist = new TreeList();
        //Iterating through the numbers of rows, -1 to not include the first row and passing them into classes
        for (int i = 0; i < csv.getNumOfRows() - 1; i++) {
            //creating an arraylist object pointing towards each iteration of get next row;
            ArrayList<String> temp2 = csv.getNextRow();
            //If the treeid value is empty or the common value is empty, skip the row
            if ((temp2.get(treeid).equals("")) || (temp2.get(common).equals(""))) {
                continue;
            } else {
                if (i == 0) {
                    // In the beginning, there are no tree species, so create a new tree species object and add to TreeSpeciesList
                    TreeSpecies a = new TreeSpecies(temp2.get(common), temp2.get(latin));
                    TreeSL.add(a);
                    // Create a tree object by parsing integer treeid and passing in the tree species
                    Tree tree = new Tree(Integer.parseInt(temp2.get(treeid)), a);
                    //Setters
                    tree.setSpc_common(temp2.get(common));
                    tree.setSpc_latin(temp2.get(latin));
                    tree.setStatus(temp2.get(status));
                    tree.setHealth(temp2.get(health));
                    // try catch if zipcode is empty, set to zero for default
                    try {
                        tree.setZipcode(Integer.parseInt(temp2.get(zipcode)));
                    } catch (NumberFormatException e) {
                        tree.setZipcode(0);
                    }
                    tree.setBoroname(temp2.get(borough));
                    //try catch if xval is empty, set to -1;
                    try {
                        tree.setX_sp(Double.parseDouble(temp2.get(xval)));
                    } catch (NumberFormatException e) {
                        tree.setX_sp(-1);
                    }
                    //try catch if yval is empty, set to -1;
                try {
                    tree.setY_sp(Double.parseDouble(temp2.get(yval)));
                } catch (NumberFormatException e) {
                    tree.setY_sp(-1);
                }
                //add the tree object to a linkedlist containing all trees passed in
                treelist.add(tree);
            }

                    //for all other rows
                else {
                    //create a new tree species object
                    TreeSpecies a = new TreeSpecies(temp2.get(common),temp2.get(latin));
                    for(int u = 0;u<TreeSL.size();u++)
                    {
                        //for loop checking if the tree species created is equal to any other tree species already existing in the tree species list
                        //if yes, do not add to treespecies list and break out of the for loop when finished
                        if(TreeSL.get(u).equals(a))
                        {
                            Tree tree = new Tree(Integer.parseInt(temp2.get(treeid)),TreeSL.get(u));
                            tree.setSpc_common(temp2.get(common));
                           tree.setSpc_latin(temp2.get(latin));
                            tree.setStatus(temp2.get(status));
                            tree.setHealth(temp2.get(health));
                            try {
                                tree.setZipcode(Integer.parseInt(temp2.get(zipcode)));
                            } catch (NumberFormatException e) {
                                tree.setZipcode(0);
                            }
                            tree.setBoroname(temp2.get(borough));
                            try {
                                tree.setX_sp(Double.parseDouble(temp2.get(xval)));
                            } catch (NumberFormatException e) {
                                tree.setX_sp(-1);
                            }

                            try {
                                tree.setY_sp(Double.parseDouble(temp2.get(yval)));
                            } catch (NumberFormatException e) {
                                tree.setY_sp(-1);
                            }
                            treelist.add(tree);
                            break;
                        }
                        // if the new tree species is not equal to any elements in the tree species list, add it to the list
                        else if(u==TreeSL.size()-1)
                        {
                            TreeSL.add(a);
                            Tree tree = new Tree(Integer.parseInt(temp2.get(treeid)),a);
                            tree.setSpc_common(temp2.get(common));
                            tree.setSpc_latin(temp2.get(latin));
                            tree.setStatus(temp2.get(status));
                            tree.setHealth(temp2.get(health));
                            try {
                                tree.setZipcode(Integer.parseInt(temp2.get(zipcode)));
                            } catch (NumberFormatException e) {
                                tree.setZipcode(0);
                            }
                            tree.setBoroname(temp2.get(borough));
                            try {
                                tree.setX_sp(Double.parseDouble(temp2.get(xval)));
                            } catch (NumberFormatException e) {
                                tree.setX_sp(-1);
                            }

                            try {
                                tree.setY_sp(Double.parseDouble(temp2.get(yval)));
                            } catch (NumberFormatException e) {
                                tree.setY_sp(-1);
                            }
                            treelist.add(tree);
                            break;
                        }
                    }

                }
                //increment the number of trees for all if statements where the row is passed into a tree object
                totalnumTrees++;

            }
     }
        csvScan.close();
        //scanner for user input
        Scanner sc = new Scanner(System.in);
        int det = 0;
        //while loop continues to loop if det is equal to 0
        while(det!=1) {
            // new integers declared that tracks the number of the user-input tree name in each borough
            int NYC = 0;
            int Manhattan = 0;
            int Bronx = 0;
            int Brooklyn = 0;
            int Queens = 0;
            int Staten_Island = 0;
            System.out.println("Enter the tree species to learn more about it (quit to stop):");
            String userInput = sc.nextLine();
            if (userInput.equals("quit")) {
                //breaks out of the while loop
                det = 1;
                continue;
            }
            //creates two temporary common and latin treespecies lists to return if user input is a latin name or a common name
            TreeSpeciesList tempcom = TreeSL.getByCommonName(userInput);
            TreeSpeciesList templat = TreeSL.getByLatinName(userInput);
            //in the case that there are latin names and no common names returned
            if (tempcom == null && templat != null) {
                System.out.println("All matching species");
                for (int i = 0; i < templat.size(); i++) {
                    System.out.println(templat.get(i).getLatin());
                }
                System.out.println("Popularity in the city:");
                System.out.println(" ");
                // for loop where treelist of all objects checks for the latin name and borough. If equal, increment the borough counter by the amount of those types of trees
                for (int i = 0; i < templat.size(); i++) {
                    Manhattan += treelist.getCountByLatinNameBorough(templat.get(i).getLatin(), "Manhattan");
                    Bronx += treelist.getCountByLatinNameBorough(templat.get(i).getLatin(), "Bronx");
                    Brooklyn += treelist.getCountByLatinNameBorough(templat.get(i).getLatin(), "Brooklyn");
                    Queens += treelist.getCountByLatinNameBorough(templat.get(i).getLatin(), "Queens");
                    Staten_Island += treelist.getCountByLatinNameBorough(templat.get(i).getLatin(), "Staten island");
                }
                //nyc is the total
                NYC = Manhattan + Bronx + Brooklyn + Queens + Staten_Island;
                //Arraylists for the purpose of making it easier to iterate through a for loop
                ArrayList<Integer> boroTotal = new ArrayList<Integer>();
                ArrayList<String> boroName = new ArrayList<String>();
                boroName.add("NYC");
                boroName.add("Manhattan");
                boroName.add("Bronx");
                boroName.add("Brooklyn");
                boroName.add("Queens");
                boroName.add("Staten Island");
                boroTotal.add(NYC);
                boroTotal.add(Manhattan);
                boroTotal.add(Bronx);
                boroTotal.add(Brooklyn);
                boroTotal.add(Queens);
                boroTotal.add(Staten_Island);
                for (int i = 0; i < boroTotal.size(); i++) {
                    //if i is equal to 0, the row printed will be all of NYC
                    if (i == 0) {
                        float percent = ((float) boroTotal.get(i) / totalnumTrees) * 100;
                        // First format to cut the float to a percentage with two decimal points
                        String a = String.format("%.2f%%", percent);
                        System.out.println(String.format("%-13s %12s %12s %12s", boroName.get(i), ":", boroTotal.get(i) + "(" + totalnumTrees + ")", a));

                    } else {
                        //if i is not equal to 0, then the rows returned will be boroughs.
                        int borocont = treelist.getCountByBorough(boroName.get(i));
                        //used to prevent float from returning 0/0, or NaN
                        if(borocont == 0)
                        {
                            borocont = 1;
                        }
                        float percent = ((float) boroTotal.get(i) / borocont * 100);
                        String a = String.format("%.2f%%", percent);
                        System.out.println(String.format("%-13s %12s %12s %12s", boroName.get(i), ":", boroTotal.get(i) + "(" + treelist.getCountByBorough(boroName.get(i)) + ")", a));
                    }
                }

                 //in the case that there are common names and no latin names returned
            } else if (tempcom != null && templat == null) {
                System.out.println("All matching species");
                for (int i = 0; i < tempcom.size(); i++) {
                    System.out.println(tempcom.get(i).getCommon());
                }
                System.out.println("Popularity in the city:");
                System.out.println(" ");
                //same methods as above but using common
                for (int i = 0; i < tempcom.size(); i++) {
                    Manhattan += treelist.getCountByCommonNameBorough(tempcom.get(i).getCommon(), "Manhattan");
                    Bronx += treelist.getCountByCommonNameBorough(tempcom.get(i).getCommon(), "Bronx");
                    Brooklyn += treelist.getCountByCommonNameBorough(tempcom.get(i).getCommon(), "Brooklyn");
                    Queens += treelist.getCountByCommonNameBorough(tempcom.get(i).getCommon(), "Queens");
                    Staten_Island += treelist.getCountByCommonNameBorough(tempcom.get(i).getCommon(), "Staten island");
                }
                NYC = Manhattan + Bronx + Brooklyn + Queens + Staten_Island;
                ArrayList<Integer> boroTotal = new ArrayList<Integer>();
                ArrayList<String> boroName = new ArrayList<String>();
                boroName.add("NYC");
                boroName.add("Manhattan");
                boroName.add("Bronx");
                boroName.add("Brooklyn");
                boroName.add("Queens");
                boroName.add("Staten Island");
                boroTotal.add(NYC);
                boroTotal.add(Manhattan);
                boroTotal.add(Bronx);
                boroTotal.add(Brooklyn);
                boroTotal.add(Queens);
                boroTotal.add(Staten_Island);
                for (int i = 0; i < boroTotal.size(); i++) {
                    if (i == 0) {
                        float percent = ((float) boroTotal.get(i) / totalnumTrees) * 100;

                        String a = String.format("%.2f%%", percent);
                        System.out.println(String.format("%-13s %12s %12s %12s", boroName.get(i), ":", boroTotal.get(i) + "(" + totalnumTrees + ")", a));

                    } else {
                        int borocont = treelist.getCountByBorough(boroName.get(i));
                        if(borocont == 0)
                        {
                            borocont = 1;
                        }
                        float percent = ((float) boroTotal.get(i) / borocont * 100);
                        String a = String.format("%.2f%%", percent);
                        System.out.println(String.format("%-13s %12s %12s %12s", boroName.get(i), ":", boroTotal.get(i) + "(" + treelist.getCountByBorough(boroName.get(i)) + ")", a));

                    }
                }

            }
            //in the case that both common and latin lists have elements
            else if(tempcom!=null &&templat!=null) {
                //set integer passer equal to the size of the common list before moving the pointer and size of common list
                int passer = tempcom.size();
                //add both common list and latin list to a temporary list containing both
                TreeSpeciesList tempboth = tempcom;
                tempboth.addAll(templat);
                System.out.println("All matching species");
                for (int c = 0; c < tempboth.size(); c++) {
                    //if the iterator c is less than the original size of the common list, print out the common name. Else, print the latin name
                    if (c < passer) {
                        System.out.println(tempboth.get(c).getCommon());
                    } else {
                        System.out.println(tempboth.get(c).getLatin());
                    }
                }
                    System.out.println("Popularity in the city:");
                System.out.println(" ");
                //as the lists are merged, there is not a need to have incrementation loops for both common and latin.
                    for (int i = 0; i < tempboth.size(); i++) {
                        if(i<passer)
                        {
                            Manhattan += treelist.getCountByCommonNameBorough(tempboth.get(i).getCommon(), "Manhattan");
                            Bronx += treelist.getCountByCommonNameBorough(tempboth.get(i).getCommon(), "Bronx");
                            Brooklyn += treelist.getCountByCommonNameBorough(tempboth.get(i).getCommon(), "Brooklyn");
                            Queens += treelist.getCountByCommonNameBorough(tempboth.get(i).getCommon(), "Queens");
                            Staten_Island += treelist.getCountByCommonNameBorough(tempboth.get(i).getCommon(), "Staten island");
                        }
                    }
                    NYC = Manhattan + Bronx + Brooklyn + Queens + Staten_Island;
                    ArrayList<Integer> boroTotal = new ArrayList<Integer>();
                    ArrayList<String> boroName = new ArrayList<String>();
                    boroName.add("NYC");
                    boroName.add("Manhattan");
                    boroName.add("Bronx");
                    boroName.add("Brooklyn");
                    boroName.add("Queens");
                    boroName.add("Staten Island");
                    boroTotal.add(NYC);
                    boroTotal.add(Manhattan);
                    boroTotal.add(Bronx);
                    boroTotal.add(Brooklyn);
                    boroTotal.add(Queens);
                    boroTotal.add(Staten_Island);
                for (int i = 0; i < boroTotal.size(); i++) {
                    if (i == 0) {
                        float percent = ((float) boroTotal.get(i) / totalnumTrees) * 100;
                        String a = String.format("%.2f%%", percent);
                        System.out.println(String.format("%-13s %12s %12s %12s", boroName.get(i), ":", boroTotal.get(i) + "(" + totalnumTrees + ")", a));

                    } else {
                        int borocont = treelist.getCountByBorough(boroName.get(i));
                        if(borocont == 0)
                        {
                            borocont = 1;
                        }
                        float percent = ((float) boroTotal.get(i) / borocont * 100);
                        String a = String.format("%.2f%%", percent);
                        System.out.println(String.format("%-13s %12s %12s %12s", boroName.get(i), ":", boroTotal.get(i) + "(" + treelist.getCountByBorough(boroName.get(i)) + ")", a));

                    }
                }
                }
           //if both temporary lists are null, return that there are no such species.
            else {
                System.out.println("No Such Species");
            }
        }
        System.exit(0);

    }
    
    }
