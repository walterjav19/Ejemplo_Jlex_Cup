
package com.mycompany.ejemplo1;



import java.io.File;

import java.io.FileReader;


public class Ejemplo1 {

    public static void main(String[] args) {
        
        interpretar("C:\\Users\\USUARIO\\Documents\\NetBeansProjects\\Ejemplo1\\src\\main\\java\\Generador\\Entrada.txt");
    }
    
    
    private static void interpretar(String path) {
        Analizador.Sintactico pars;
        try {
            pars=new Analizador.Sintactico(new Analizador.Lexico(new FileReader(path)));
            pars.parse();        
        } catch (Exception ex) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println("Causa: "+ex.getCause());
        } 
    }
}
