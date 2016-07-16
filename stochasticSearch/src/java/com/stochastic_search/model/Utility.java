
package com.stochastic_search.model;

import java.util.Date;

/**
 *
 * @author Chathura Dananjaya Rupasinghe (14208554)
 */
public class Utility {    //to define commen methods 


//this enum is used to store the data of the file inmemorry to process with algorithm

    public enum insCheck {

        INSTANCE;
        private PreferenceTable table;

        public PreferenceTable getTable() {
            return table;
        }

        public void setTable(PreferenceTable table) {
            this.table = table;
        }

    };

    public static String timeFormat(Date time1, Date time2) {
        //this method is used to get two date objects and compare its' difference and return 
        //as '3 seconds' etc
        long diff = time2.getTime() - time1.getTime();
        long diffMinutes = diff / (60 * 1000) % 60;
        long diffSeconds = diff / 1000 % 60;
        if (diffMinutes != 0) {

            return diffMinutes + " Minutes";

        } else if (diffSeconds != 0) {

            return diffSeconds + " Seconds";
        } else {
            System.out.println("mili");
            return diff + " Miliseconds";
        }
    }

}
