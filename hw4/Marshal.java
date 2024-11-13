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
    private static void xmlToJson(String inputFile, String outputFile) {
        try {
            BufferedReader in = new BufferedReader(
                new FileReader(new File(inputFile + ".xml").getAbsolutePath())
            );
            BufferedWriter out = new BufferedWriter(
                new FileWriter(new File(outputFile + ".json").getAbsolutePath())
            );

            JSONObject json = XML.toJSONObject(in);
            out.write(json.toString(4));

            out.flush();
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }

    }

    public static void main(String[] args) {
        Marshal.xmlToJson("buildings", "building");
        Marshal.xmlToJson("students", "student");
    }
}