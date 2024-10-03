package utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ResourceLoader {

    public static Properties propertiesObj = null;

    public static synchronized void loadProperties() throws Exception {

        if (propertiesObj == null) {

            LogUtil.info("Loading Properties");

            String path = System.getProperty("karate.env");

            propertiesObj = new Properties();

            String resourcePath = System.getProperty("user.dir") + "/src/test/resources/" + path;

            LogUtil.info("Resources :: " + resourcePath);

            File directoryPath = new File(resourcePath);

            File filesList[] = directoryPath.listFiles();

            LogUtil.info("List of files and directories in the specified directory :");

            for (File file : filesList) {
                LogUtil.info(("File name: " + file.getName()));
                LogUtil.info("File path: " + file.getAbsolutePath());
                LogUtil.info("Size :" + file.length());
                loadFile(file);  // Pass the file object directly
            }
        }
    }

    public static void loadFile(File file) {

        LogUtil.info("Loading Resources for file: " + file.getAbsolutePath());

        try (FileInputStream inputStreamObj = new FileInputStream(file)) {

            propertiesObj.load(inputStreamObj);

            LogUtil.info(propertiesObj.toString());

            System.out.println("Resources Loaded Successfully for : " + file.getAbsolutePath());

        } catch (IOException e) {
        	LogUtil.error("Error loading properties file: " + file.getAbsolutePath() + " - " + e.getMessage());
        }
    }

    public static String getValue(String key) {
        return propertiesObj.getProperty(key);
    }
}
