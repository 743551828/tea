package com.ahau;

import java.io.*;

public class test {
    public static void main(String[] args) throws IOException {
        File file=new File("D:\\file\\test_prelabel.txt");
        InputStreamReader inputStreamReader=new InputStreamReader(new FileInputStream(file),"GBK");
        BufferedReader reader=new BufferedReader(inputStreamReader);
        String lineTxt;
        int i=0;
        while ((lineTxt=reader.readLine())!=null){
            System.out.println(lineTxt);
            i++;
        }
        System.out.println(i);

        reader.close();
    }
}
