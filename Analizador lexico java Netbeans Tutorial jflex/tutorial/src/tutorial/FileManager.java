/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorial;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;

/**
 *
 * @author Xizayu
 */
public class FileManager {
    public ArrayList<String> leeArchivo(String strFile){
        ArrayList<String> altexto=null;
        FileReader fr=null;
        BufferedReader br=null;
        File ffile=null;
        String strLine=null;
        try{
            altexto =new ArrayList<String>();
            ffile = new File(strFile);
            if(ffile.exists()){
                if(ffile.isFile()){
                    fr= new FileReader(ffile);
                    br= new BufferedReader(fr);
                    strLine=br.readLine();
                    while(strLine!=null){
                        if (!strLine.equalsIgnoreCase("")){
                            altexto.add(strLine);
                        }
                        strLine=br.readLine();
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return altexto;
    }
}
