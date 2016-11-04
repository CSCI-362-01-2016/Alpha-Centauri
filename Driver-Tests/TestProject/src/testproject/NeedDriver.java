/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testproject;

/**
 *
 * @author amesk
 */
public class NeedDriver {
    private String testName;
    
     public void print() {
        System.out.println("this is a test");
        
    }
     
     public void setName(String name)
     {
         testName = name; 
     }
     
     public String getName()
     {
         return testName;
     }
}
