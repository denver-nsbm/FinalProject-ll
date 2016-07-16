
package com.stochastic_search.controller;

import com.stochastic_search.model.StudentEntry;
import java.util.Stack;


public class CandidateAssignment {

    private StudentEntry studentEntry;
    private Stack<String> projectAssignment;

    public StudentEntry getStudentEntry() {
        return studentEntry;
    }

    public void setStudentEntry(StudentEntry studentEntry) {
        this.studentEntry = studentEntry;
    }

    public Stack<String> getProjectAssignment() {
        return projectAssignment;
    }

    public CandidateAssignment() {
        projectAssignment = new Stack<String>();

    }

    public CandidateAssignment(StudentEntry studentEntry) {
        this();
        this.studentEntry = studentEntry;
        randomizeAssignment();

    }

    public void randomizeAssignment() {
        projectAssignment.push(studentEntry.getRandomPreference());

    }

    public void undoChange() {
        try {

            projectAssignment.pop();

        } catch (Exception e) {
            
        }
    }

    public int getEnergy() {

        int rank = getStudentEntry().getRanking(getProjectAssignment().peek());
        rank++;
        return (rank * rank);
    }

    public void assignAssignmentByIndex(int index) {

        projectAssignment.push(studentEntry.getOrderedPreferences().get(index));

    }

    
    
    
}
