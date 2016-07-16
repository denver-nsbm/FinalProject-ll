
package com.stochastic_search.controller;

import com.stochastic_search.model.PreferenceTable;

/**
 *
 * @author Chathura Dananjaya Rupasinghe (14208554)
 */
public class SimulatedAnnealing {
    
    private long iterations = 0; // no of iterations algoritham should run
    private PreferenceTable preferenceTable;
     
     public SimulatedAnnealing(){
        
         
         
     }
     
      public SimulatedAnnealing(long iterations){
          
          this();
          this.iterations = iterations;
          
          
      }
      
       public SimulatedAnnealing(PreferenceTable preferenceTable,long iterations){
          
          this(iterations);
          this.preferenceTable = preferenceTable;
          
          
      }
      
    public long getIterations() {
        return iterations;
    }

   
    public void setIterations(long iterations) {
        this.iterations = iterations;
    }
    
    
   
    public PreferenceTable getPreferenceTable() {
        return preferenceTable;
    }

  
    public void setPreferenceTable(PreferenceTable preferenceTable) {
        this.preferenceTable = preferenceTable;
    }
    
    
    
      public CandidateSolution anneal(){
          
          CandidateSolution currentSolution = new CandidateSolution(this.preferenceTable);
          
         
         
          double T  = 1.0;
          double  T_min = 0.00001;
          double A = 0.9;
          
           while (T > T_min){
               
            for(int i=0;i<this.iterations;i++){

              CandidateSolution candidateSolution =   new CandidateSolution(this.preferenceTable);
              
             
              
              if( candidateSolution.getEnergy() < currentSolution.getEnergy()){

                  currentSolution = candidateSolution;
              }

               T = T*A;
            }
           }
          
          return currentSolution;
          
       
      }

    

       
}
