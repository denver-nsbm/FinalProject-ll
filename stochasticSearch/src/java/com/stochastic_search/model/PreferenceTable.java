
package com.stochastic_search.model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;

/**
 *
 * @author Chathura Dananjaya Rupasinghe (14208554)
 */
public class PreferenceTable {

    private List<StudentEntry> studentList;
    private Hashtable<String, StudentEntry> studentLookUp;
    private List<String> projectsList = new ArrayList<String>();

    public Hashtable<String, StudentEntry> getStudentMap() {
        return studentLookUp;
    }

    public void setStudentMap(Hashtable<String, StudentEntry> studentMap) {
        this.studentLookUp = studentMap;
    }

    public PreferenceTable() {

    }

    public PreferenceTable(InputStream stream) {
        studentList = new ArrayList<StudentEntry>();
        studentLookUp = new Hashtable<String, StudentEntry>();
        loadContentFromFile(stream);

    }

    private void loadContentFromFile(InputStream stream) {
        try {
            
            //Adding InputStream to a Buffer Reader Itarate(read) the file
            BufferedReader input = new BufferedReader(new InputStreamReader(stream));
            input.readLine();//to avoid reading first line
            String line = "";
            while ((line = input.readLine()) != null) { //this will get line by line in file and add current line to 'line' variable

                StringTokenizer tokens = new StringTokenizer(line, "\t"); //spliting the line by tab

                String name = tokens.nextToken(); //getting the first token 'student Name'
                String isPre_Assign = tokens.nextToken(); //getting the second token 'Yes/No' as project preassigned or not
                StudentEntry entry = new StudentEntry(name); //creating a instance of studentEntry with a parametarized constructor

                entry.setHasPreassignedProject(isPre_Assign.equalsIgnoreCase("Yes"));
                //storing preassignProject true or false 'equalsIgnoreCase' will return true or false

                List<String> preferenceList = new LinkedList<String>();//initialising hashset to keep projects
                while (tokens.hasMoreTokens()) {
                    String pname = tokens.nextToken();//getting project name
                    if (!projectsList.contains(pname.intern()) && isPre_Assign.equalsIgnoreCase("No")) {
                        projectsList.add(pname.intern());//adding all the projects to the list
                    } 
                    if (!preferenceList.contains(pname.intern()) ) {
                        preferenceList.add(pname.intern());//adding project to preferenceList
                    }

                    if (isPre_Assign.equalsIgnoreCase("Yes")) {

                        entry.preassignProject(pname.intern());//stores the preassign project Name
                    }
                }

                entry.setOrderedPreferences(preferenceList);//setting the prefered project
                entry.setNumberOfStatedPreferences(preferenceList.size());//setting the number or prreferenced projects

                this.studentList.add(entry);//setting the studententry to student list
                this.studentLookUp.put(name, entry);//setting the student name and student entry to hashTable

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public List<StudentEntry> getAllStudentEntries() {

        return this.studentList;

    }

    public StudentEntry getEntryFor(String sname) {

        return studentLookUp.get(sname);

    }

    public StudentEntry getRandomStudent() {

        return studentList.get(RandomSingleton.INSTANCE.getRandom(studentList.size()));
    }

    public String getRandomPreference() {

        return projectsList.get(RandomSingleton.INSTANCE.getRandom(projectsList.size()));

    }

    public void fillPreferencesOfAll(int maxPref) {
        for (StudentEntry s : getAllStudentEntries()) {
            if (!s.hasPreassignedProject()) {
                List<String> pList = new LinkedList<String>();//used linked list to keep the order 
                pList.addAll(s.getOrderedPreferences());

                while (pList.size() < maxPref) {

                    String pName = getRandomPreference();
                    if (!s.getOrderedPreferences().contains(pName.intern())) {
                        pList.add(pName);

                    }
                }

                s.setOrderedPreferences(pList);

            }
        }

    }

    public int getRandomInt(Random rand, int size) {

        return rand.nextInt(size);

    }

    public enum RandomSingleton {//used e num to keep single instance

        INSTANCE;

        private static final Random randomStudent = new Random();

        public int getRandom(int size) {

            return randomStudent.nextInt(size);
        }
    }
}
