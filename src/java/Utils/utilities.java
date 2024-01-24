/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

/**
 *
 * @author ptd
 */
public class utilities {
    
    public static boolean isNumber(String input){
        return input.matches("^\\d+$");
    }
    
    public static boolean isInteger(String str) {
        if (str == null || str.isEmpty()) {
            return false;
        }
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
    
    public static boolean isPositive(String input){
        if(!isInteger(input)){
            return false;
        }
        
        if(Integer.parseInt(input) <= 0){
            return false;
        }
        return true;
    }
    
    public static boolean isPositiveNumber(String input){
        
        if(Float.parseFloat(input) <= 0){
            return false;
        }
        return true;
    }
}
