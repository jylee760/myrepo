package project4;
import java.util.Iterator;
import java.util.Scanner;
import java.io.*;
import java.util.ArrayList;

/**
 *This program reads in a command argument of a binary search tree of type RestStop in the form of a mountain
 *Return every valid path from the mountain in the form of Strings.
 * @author John Lee
 */
public class MountainClimb {
    public static void main(String[] args) {
        File f;
        Scanner Scan = null;
        if (args.length < 1) {
            System.err.println("Usage Error: the program expects file name as an argument.");
            System.exit(0);
        }
        try {
            f = new File(args[0]);
            Scan = new Scanner(f);
        } catch (FileNotFoundException e) {
            System.err.println("Error: the file " + args[0] + " cannot be opened");
            System.exit(0);
        }
        ArrayList<String> lines = new ArrayList<>();
        while(Scan.hasNextLine())
        {
            lines.add(Scan.nextLine());
        }
        RestStop[] rest = new RestStop[lines.size()];
        for(int i = 0;i<lines.size();i++)
        {
            String[] words = lines.get(i).split(" ");
            String stopName = " ";
            ArrayList<String> Supplies = new ArrayList<>();
            ArrayList<String> Obstacles = new ArrayList<>();
            for(int g = 0;g<words.length;g++)
            {
                if(g ==0) {
                    stopName = words[g];
                }
                else
                {
                    if(words[g].equalsIgnoreCase("food") || words[g].equalsIgnoreCase("raft")||words[g].equalsIgnoreCase("axe"))
                    {
                        Supplies.add(words[g]);
                    }
                    else if(words[g].equalsIgnoreCase("river"))
                    {
                        Obstacles.add(words[g]);
                    }
                    else if(words[g].equalsIgnoreCase("fallen"))
                    {
                        if(g+1<words.length)
                        {
                            if(words[g+1].equalsIgnoreCase("tree"))
                            {
                                Obstacles.add(words[g] + " " + words[g+1]);
                            }
                        }
                    }
                }
                if(g == words.length-1)
                {
                    RestStop tempStop = new RestStop(stopName,Supplies,Obstacles);
                    rest[i] = tempStop;
                }
            }
        }
        BSTMountain mountain = new BSTMountain(rest);
        ArrayList<String> paths= mountain.traverse();
        for(int i = 0;i<paths.size();i++)
        {
            System.out.println(paths.get(i));
        }
    }
}
