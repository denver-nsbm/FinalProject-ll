
package com.stochastic_search.model;

/**
 *
 * @author Chathura Dananjaya Rupasinghe (14208554)
 */
public class resultModel {
    //This class is used to map the result for diplay purposeses
    private StudentEntry student;
    private String project1;
    private String project2;
    private Integer dissapointment;
    private Integer dissapointment2;
    private Boolean project1IsPreference; //to store if it's preffered by student or not
    private Boolean project2IsPreference;

    public Boolean getProject1IsPreference() {
        return project1IsPreference;
    }

    public void setProject1IsPreference(Boolean project1IsPreference) {
        this.project1IsPreference = project1IsPreference;
    }

    public Boolean getProject2IsPreference() {
        return project2IsPreference;
    }

    public void setProject2IsPreference(Boolean project2IsPreference) {
        this.project2IsPreference = project2IsPreference;
    }

    
    
    public StudentEntry getStudent() {
        return student;
    }

    public void setStudent(StudentEntry student) {
        this.student = student;
    }

    public String getProject1() {
        return project1;
    }

    public void setProject1(String project1) {
        this.project1 = project1;
    }

    public String getProject2() {
        return project2;
    }

    public void setProject2(String project2) {
        this.project2 = project2;
    }

 
    public Integer getDissapointment() {
        return dissapointment;
    }

    public void setDissapointment(Integer dissapointment) {
        this.dissapointment = dissapointment;
    }

    public Integer getDissapointment2() {
        return dissapointment2;
    }

    public void setDissapointment2(Integer dissapointment2) {
        this.dissapointment2 = dissapointment2;
    }

 
    
    
}
