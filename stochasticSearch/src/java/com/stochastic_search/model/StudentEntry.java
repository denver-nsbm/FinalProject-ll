package com.stochastic_search.model;

import java.util.List;

/**
 *
 * @author Chathura Dananjaya Rupasinghe (14208554)
 */
public class StudentEntry {

    private String studentName;
    private boolean hasPre_assigned;
    private List<String> preferred_projects; // Used a Hashset to avoid duplicated in projects
    private int numberOfStatedPreferences = 0;
    private String preAssignProject;

    public boolean isHasPre_assigned() {
        return hasPre_assigned;
    }

    public void setHasPre_assigned(boolean hasPre_assigned) {
        this.hasPre_assigned = hasPre_assigned;
    }

    public StudentEntry(String studentName) {
        this.studentName = studentName;

    }

    public List<String> getPreferred_projects() {
        return preferred_projects;
    }

    public void setPreferred_projects(List<String> preferred_projects) {
        this.preferred_projects = preferred_projects;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public boolean hasPreassignedProject() {
        return hasPre_assigned;
    }

    public void setHasPreassignedProject(boolean hasPre_assigned) {
        this.hasPre_assigned = hasPre_assigned;
    }

    public List<String> getOrderedPreferences() {
        return preferred_projects;
    }

    public void setOrderedPreferences(List<String> preferred_projects) {
        this.preferred_projects = preferred_projects;
    }

    public void preassignProject(String pname) {
        this.preAssignProject = pname;
    }

    public int getNumberOfStatedPreferences() {

        return this.numberOfStatedPreferences;
    }

    public void setNumberOfStatedPreferences(int numberOfStatedPreferences) {
        this.numberOfStatedPreferences = numberOfStatedPreferences;
    }

    public void addProject(String pname) {
        this.preferred_projects.add(pname.intern());

    }

    public String getPreAssignProject() {
        return preAssignProject;
    }

    public String getRandomPreference() {

        return this.getOrderedPreferences().get(PreferenceTable.RandomSingleton.INSTANCE.getRandom(this.getOrderedPreferences().size()));
    }

    public int getRanking(String pName) {

        if (this.hasPre_assigned && this.preAssignProject.contentEquals(pName)) {

            return 0;
        }

        return this.getOrderedPreferences().indexOf(pName);

    }

}
