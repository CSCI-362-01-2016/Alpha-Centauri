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

public class DriverTest {
    

    public static void main(String[] args)
    {
        
        NeedDriver nD = new NeedDriver();
        
        for(int i = 0; i < args.length; i++)
        {
           System.out.println(args[i]);
        }
        
        nD.print();
        nD.setName(args[0]);
        System.out.println(nD.getName());
    }
}
