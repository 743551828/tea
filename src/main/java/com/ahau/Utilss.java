package com.ahau;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.springframework.web.multipart.MultipartFile;


public class Utilss {

    public static void main(String[] args) throws FileNotFoundException {
        List list=getMyXLS("D:\\file\\train_data90.xls");
        System.out.println(((List)list.get(0)).get(0));
        System.out.println(((List)list.get(1)).get(0));
    }

    public static void runPython(String pythonPath){
        try {
            Process process=Runtime.getRuntime().exec("cmd /c python "+pythonPath);
            process.waitFor();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void fileUpLoad(MultipartFile multipartFile,String path,String fileName) throws IOException {

                File file = new File(path, fileName);
                if (!file.getParentFile().exists()) {
                    file.getParentFile().mkdirs();
                }
                multipartFile.transferTo(new File(path + File.separator + fileName));

    }

    public static List getMyTxt(String txtPath)throws IOException{
        File file=new File(txtPath);
        InputStreamReader inputStreamReader=new InputStreamReader(new FileInputStream(file),"GBK");
        BufferedReader reader=new BufferedReader(inputStreamReader);
        List list=new ArrayList();
        String lineTxt;
        while ((lineTxt=reader.readLine())!=null){
            list.add(lineTxt);
        }
        reader.close();
        return list;
    }


    public static List getMyXLS(String excelPath) throws FileNotFoundException {
        /*文件的方式读取*/
        // File xlsOrxlsxFile = new File("D:/EXCEL/55.xls");
        /*流处理的方式*/
        // FileInputStream  xlsOrxlsxFile = new FileInputStream("D:/EXCEL/55.xls");
        //  FileInputStream  xlsOrxlsxFile = new FileInputStream("E:/企业信息表.xls");
        FileInputStream  xlsOrxlsxFile = new FileInputStream(excelPath);
       /*
        if(!xlsOrxlsxFile.exists())
        {
            System.out.println(00);
            return ;         
        }
        */    /*文件不存在的情况直接终止返回*/
        if(xlsOrxlsxFile==null)
        {
            System.out.println("文件不存在...");
            return null;
        };

        try {
            /*通过流或者是文件创建一个Workbook对象*/
            //Workbook wb = createworkbook(xlsOrxlsxFile);
            Workbook wb = WorkbookFactory.create(xlsOrxlsxFile);

            /*获取EXCEL表的子表sheet的总数*/
            int sheetNum = wb.getNumberOfSheets();

            /*创建一个子表对象Sheet*/
            Sheet sheet = null;

            /*遍历子表对象从下标为0的子表对象开始进行遍历*/
            for(int sheetIndex = 0;sheetIndex<sheetNum;sheetIndex++)
            {

                /*通过下标获取EXCEL表格当前子表对象*/
                sheet = wb.getSheetAt(sheetIndex);

                /*创建数组，用来存放列数据*/
                List<List> lists1=new ArrayList<>();
                for (int i=0;i<sheet.getRow(0).getLastCellNum();i++){
                    lists1.add(new ArrayList<Double>());
                }
                List<List> lists2=new ArrayList<>();
                for (int i=0;i<=sheet.getLastRowNum();i++){
                    lists2.add(new ArrayList<Double>());
                }

                /*创建一个行对象*/
                Row row = null;

                /*获取第一行下标*/
                int firstRowNum = sheet.getFirstRowNum();

                /*获取最后一行下标*/
                int lastRowNum = sheet.getLastRowNum();

                /*遍历每行遍历row(行 0开始)*/
                for (int rowIndex = firstRowNum;rowIndex<=lastRowNum;rowIndex++ )
                {
                    /*获取当前行对象*/
                    row = sheet.getRow(rowIndex);

                    /*判断如果行存在*/
                    if(null != row)
                    {

                        /*通过行取到第一格下标*/
                        int firstCellNum = row.getFirstCellNum();

                        /*通过行对象取得最后一格下标*/
                        int lastCellNum = row.getLastCellNum();

                        /*遍历行对象的每格，遍历cell（列 0开始）*/
                        for (int cellIndex = firstCellNum; cellIndex < lastCellNum; cellIndex++)
                        {

                            /*通过格子index和行返回设置返回格子对象*/
                            Cell cell = row.getCell(cellIndex, Row.RETURN_BLANK_AS_NULL);

                            /*如果存在cell对象*/
                            if (cell!=null ) {

                                /*创建一个对象保存cell数据*/
                                Double cellValue = null;//cellValue的值
                                cellValue=cell.getNumericCellValue();
                                lists1.get(cellIndex).add(cellValue);
                                lists2.get(rowIndex).add(cellValue);
                            }
                            else
                            {
                                //TODO cell is null 用 *** 代替输出
                                System.out.println("***");
                            }
                        }//end cell
                    }
                    else
                    {
                        //TODO row is null
                        System.out.println("EXCEL表中数据为空");
                    }
                }//行遍历结束
                //System.out.println(lists);
                List list=new ArrayList();
                list.add(lists1);
                list.add(lists2);
                return list;
            }//表遍历结束
        } catch (InvalidFormatException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return null;
    }
}