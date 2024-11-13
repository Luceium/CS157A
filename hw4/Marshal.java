import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOError;
import java.io.IOException;

public class Marshal {
    private String path;

    public Marshal(String path) {
        this.path = path;
    }

    private void xmlToJson(String fileName) {
        fileName = fileName.endsWith(".xml") ? fileName.substring(0, fileName.length()-4) : fileName;
        try {
            BufferedInputStream in = new BufferedInputStream(new FileInputStream(new File(path + fileName + ".xml")));
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(path + fileName + ".json")));

            out.flush();
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }

    }
    private void jsonToXml(String fileName) {
        fileName = fileName.endsWith(".json") ? fileName.substring(0, fileName.length()-5) : fileName;
        try {
            BufferedInputStream in = new BufferedInputStream(new FileInputStream(new File(path + fileName + ".json")));
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(path + fileName + ".xml")));

            out.flush();
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        String path = args.length > 0 ? args[0] : "C:\\Users\\User\\Desktop\\";
        Marshal marshal = new Marshal(path);
        marshal.xmlToJson("buildings.xml");
        marshal.xmlToJson("students.xml");
    }
}