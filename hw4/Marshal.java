import org.json.JSONObject;
import org.json.XML;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOError;
import java.io.IOException;

public class Marshal {
    private String path;

    public Marshal(String path) {
        this.path = path;
    }

    private void xmlToJson(String inputFile, String outputFile) {
        try {
            BufferedReader in = new BufferedReader(
                new FileReader(new File(path + inputFile + ".xml"))
            );
            BufferedWriter out = new BufferedWriter(
                new FileWriter(new File(path + outputFile + ".json"))
            );

            JSONObject json = new XML.toJSONObject(in);
            out.write(json.toString(4));

            out.flush();
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }

    }

    public static void main(String[] args) {
        String path = args.length > 0 ? args[0] : "C:\\Users\\User\\Desktop\\";
        Marshal marshal = new Marshal(path);
        marshal.xmlToJson("buildings", "building");
        marshal.xmlToJson("students", "student");
    }
}