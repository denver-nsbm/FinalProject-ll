package com.stochastic_search.controller;

import com.stochastic_search.model.PreferenceTable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author Chathura Dananjaya Rupasinghe (14208554)
 */
public class GeneticAlgorithm {

    private long initialPopulation = 0;//initial number of populations
    private long generations = 0;//no of generations angoritham should run
    private PreferenceTable preferenceTable;
    private List<CandidateSolution> newPopulation;

    public GeneticAlgorithm() {

    }

    public GeneticAlgorithm(PreferenceTable preferenceTable, long InitialPopulation, long generations) {
        this();
        this.initialPopulation = InitialPopulation;
        this.preferenceTable = preferenceTable;
        this.newPopulation = new LinkedList<CandidateSolution>();
        this.generations = generations;

    }

    public long getInitialPopulation() {
        return initialPopulation;
    }

    public void setInitialPopulation(long initialPopulation) {
        this.initialPopulation = initialPopulation;
    }

    public PreferenceTable getPreferenceTable() {
        return preferenceTable;
    }

    public void setPreferenceTable(PreferenceTable preferenceTable) {
        this.preferenceTable = preferenceTable;
    }

    public void process() {

        for (int i = 0; i < this.generations; i++) {

            List<CandidateSolution> tempSolutionList = new LinkedList<CandidateSolution>();
            for (int j = 0; j < this.newPopulation.size(); j++) {

                CandidateSolution currentSolution = this.newPopulation.get(j);
                CandidateSolution nextSolution = null;
                try {
                    nextSolution = this.newPopulation.get(j + 1);
                } catch (Exception e) {
                    nextSolution = this.newPopulation.get(0);

                }
                //select a crossover point  randomly to  mutate them
                int cross_point = (crossOverPoint(currentSolution.getSolutionList().size(), 2) / 2);
                CandidateSolution newSOl = new CandidateSolution();

                newSOl.a(currentSolution.getSolutionList().subList(0, cross_point));

                newSOl.a(nextSolution.getSolutionList().subList(cross_point, nextSolution.getSolutionList().size()));
                CandidateSolution newSOl2 = new CandidateSolution();

                newSOl2.a(nextSolution.getSolutionList().subList(0, cross_point));

                newSOl2.a(currentSolution.getSolutionList().subList(cross_point, currentSolution.getSolutionList().size()));

                List<CandidateSolution> solListTemp = new ArrayList<CandidateSolution>();
                solListTemp.add(newSOl);

                solListTemp.add(newSOl2);
                Collections.sort(solListTemp);

                if (solListTemp.get(0).getFitness() < currentSolution.getFitness()) {
                    tempSolutionList.add(currentSolution);

                } else {
                    tempSolutionList.add(solListTemp.get(0));
                }

            }

            if (!tempSolutionList.isEmpty()) {

                this.newPopulation.clear();
                this.newPopulation.addAll(tempSolutionList);
                tempSolutionList.clear();
            }
        }

    }

    public int crossOverPoint(int max, int min) {

        return new Random().nextInt(max) + min;

    }

    public CandidateSolution populate() {
        for (int i = 0; i < this.initialPopulation; i++) {

            CandidateSolution candidateSolution = new CandidateSolution(this.preferenceTable);

            newPopulation.add(candidateSolution);

        }

        Collections.sort(this.newPopulation);
        process();

        return this.newPopulation.get(0);

    }

}
