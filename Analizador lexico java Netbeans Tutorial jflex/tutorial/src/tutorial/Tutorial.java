/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorial;

import java.io.File;

/**
 *
 * @author Xizayu
 */
public class Tutorial {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String path = "C:/Users/Xizayu/Documents/NetBeansProjects/tutorial/src/tutorial/lexer.flex";
        generarLexico(path);
    }
    
    public static void generarLexico(String path){
        File file = new File(path);
        JFlex.Main.generate(file);
    }
    
}
