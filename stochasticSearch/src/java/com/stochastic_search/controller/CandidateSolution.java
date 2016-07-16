
package com.stochastic_search.controller;

import com.stochastic_search.model.PreferenceTable;
import com.stochastic_search.model.StudentEntry;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Chathura Dananjaya Rupasinghe (14208554)
 */
public class CandidateSolution implements Comparable<CandidateSolution> {

    public static final int constpenalty = 10;
    private PreferenceTable preferenceTable;
    private Hashtable<String, CandidateAssignment> solutionProjects = new Hashtable<String, CandidateAssignment>();
    private Hashtable<String, CandidateAssignment> solutions = new Hashtable<String, CandidateAssignment>();
    private List<CandidateAssignment> solutionList = new LinkedList<CandidateAssignment>();
    private HashSet<String> panelties = new HashSet<String>();
    private Integer energy = 0;

    public Integer getEnergy() {

        int panelty = 0;
        int enerygy = 0;
        panelties = new HashSet<String>();
        this.solutions = new Hashtable<String, CandidateAssignment>();

        for (CandidateAssignment assignment : getSolutionList()) {

            CandidateAssignment cand = assignment;

            if (!panelties.contains(cand.getProjectAssignment().peek().intern())) {//keep track of panelties 
                panelty += constpenalty;
                panelties.add(cand.getProjectAssignment().peek().intern());

            }

            enerygy += cand.getEnergy();

        }

        return (panelty + enerygy);
    }

    public void setEnergy(Integer energy) {
        this.energy = energy;
    }

    public CandidateSolution() {

    }

    public void setSolutionList(List<CandidateAssignment> solutionList) {
        this.solutionList = solutionList;
    }
    
    public void a(List<CandidateAssignment> a){
    this.solutionList.addAll(a);
    }

    public void addSolution(CandidateAssignment assignment) {

        this.solutionList.add(assignment);
    }

    public CandidateSolution(PreferenceTable preferenceTable) {

        this.preferenceTable = preferenceTable;
        this.panelties = new HashSet<String>();
        for (StudentEntry student : this.preferenceTable.getAllStudentEntries()) {

            CandidateAssignment cand = new CandidateAssignment(student);
            this.solutionList.add(cand);

        }

    }

    public void setPreferenceTable(PreferenceTable preferenceTable) {
        this.preferenceTable = preferenceTable;
    }

    public PreferenceTable getPreferenceTable() {
        return preferenceTable;
    }

    public CandidateAssignment getAssignmentFor(String stdName) {

        CandidateAssignment ca = new CandidateAssignment(this.preferenceTable.getEntryFor(stdName));
        return ca;

    }

    public CandidateAssignment getRandomAssignment() {

        CandidateAssignment rand = new CandidateAssignment(this.preferenceTable.getRandomStudent());
        return rand;

    }

    public int getFitness() {

        return getEnergy() * -1;
    }

    public HashSet<String> getPanelties() {
        return panelties;
    }

    public Hashtable<String, CandidateAssignment> getSolutions() {
        return this.solutions;
    }

    public List<CandidateAssignment> getSolutionList() {
        return solutionList;
    }

    @Override
    public int compareTo(CandidateSolution o) {
//compareable interface to compare Candidate Solutions fitness 
        if (this.getFitness() == o.getFitness()) {
            return 0;
        }
        return this.getFitness() > o.getFitness() ? -1 : 1;
    }

    public String findAssignmentByStudent(String studentName) {
        for (CandidateAssignment ca : this.getSolutionList()) {
            if (ca.getStudentEntry().getStudentName().equals(studentName)) {
                return ca.getProjectAssignment().peek();
            }
        }
        return null;
    }

}
