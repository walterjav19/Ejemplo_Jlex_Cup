
package Generador;

import java.io.File;


public class G_Lexico {
    public static void main(String[] args) {
        String ruta="src/main/java/Analizador/lexico.jflex";
        generarLexer(ruta);
    }
    
    public static void generarLexer(String ruta){
        File archivo=new File(ruta);
        jflex.Main.generate(archivo);
    }
    
    
    
}
