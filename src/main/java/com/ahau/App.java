package com.ahau;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static com.ahau.Utilss.fileUpLoad;
import static com.ahau.Utilss.getMyTxt;
import static com.ahau.Utilss.runPython;

/**
 * Hello world!
 *
 */
@Controller
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
    }



    /**
     * 1.调用fileUpLoad()方法，将文件保存到本地“D:/file/”文件夹下。
     * 2.调用pythonRunning()方法，启动python脚本。
     * 3.调用getMyXLS()方法，解析训练集（train-data）Excel文件，并将数据存入二维数组。
     * 4.读取python脚本生成的结果集。
     * 5.将二维数组、结果集返回
     * @param //multipartFile
     * @return
     */
    @RequestMapping(value = "axx",method = RequestMethod.POST)
    @ResponseBody
    public String test(MultipartFile train_data,MultipartFile train_label,MultipartFile text_data,MultipartFile text_label){
        try {
            String filePath="D:\\file";
            String pythonPath="C:\\Users\\74355\\Desktop\\茶叶光谱\\si-pls\\test.py";
            fileUpLoad(train_data,filePath,"train_data90.xls");
            fileUpLoad(train_label,filePath,"train_labels90.xls");
            fileUpLoad(text_data,filePath,"test_data30.xls");
            fileUpLoad(text_label,filePath,"test_labels30.xls");
            runPython(pythonPath);
            List xlsList= (List) Utilss.getMyXLS(filePath+"\\train_data90.xls").get(0);
            List txtList=getMyTxt("D:\\file\\test_prelabel.txt");
            List xlsList2= (List) Utilss.getMyXLS(filePath+"\\train_data90.xls").get(1);
            List list=new ArrayList();
            list.add(xlsList);
            list.add(txtList);
            list.add(xlsList2);
            return ""+list;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    @ResponseBody
    @RequestMapping(value = "cxx",method = RequestMethod.POST)
    public String update1() {
        try {
            String filePath = "D:\\file";
            List xlsList = Utilss.getMyXLS(filePath + "\\train_data90.xls");
            return "" + xlsList.get(0);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }


    @ResponseBody
    @RequestMapping(value = "bxx",method = RequestMethod.POST)
    public String update2(){
        try {
            String filePath="D:\\file";
            List xlsList= Utilss.getMyXLS(filePath+"\\test_data30.xls");
            return ""+xlsList.get(0);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }


    }

    @ResponseBody
    @RequestMapping(value = "dxx",method = RequestMethod.POST)
    public String update3(double[][] data){
        System.out.println(data);
        return "ok";
    }





}
