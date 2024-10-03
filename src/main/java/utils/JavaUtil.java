package utils;

import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Assert;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map.Entry;

public class JavaUtil {


    public static String generateEmail() {
        return RandomStringUtils.random(10, "abcdefghijklmnopqrstuvwxyz") + "@" + "dummyemail.com";
    }

    public static String generateRandomString() {
        return RandomStringUtils.randomAlphabetic(10);

    }

    public static String generateRandomNumber(int i) {
        return RandomStringUtils.randomNumeric(i);
    }


    public static String getTimeStamp() {

        SimpleDateFormat dateFormat1 = new SimpleDateFormat("dd-MM-yyyy-hh-mm-ss");

        String timeStamp = dateFormat1.format(new Date());

        return timeStamp;
    }

    public static void createDirectory(String directoryName) {

        File dir = new File(directoryName);

        boolean successful = false;

        try {
            dir.mkdir();
            successful = true;
            LogUtil.info("Directory created :: " + directoryName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void assertEqual(String actual, String expected) {
        Assert.assertEquals(actual, expected);
    }


    public static String getCurrentDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        Date date = new Date();
        return formatter.format(date);
    }

    public static String getCurrentTimeStamp() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy-HH-mm-ss");
        Date date = new Date();
        return formatter.format(date);
    }

    public static void sleepForSeconds(int i) {

        try {
            Thread.sleep(i * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void assertEqual(int actual, int expected) {

        Assert.assertEquals(actual, expected);
    }

    public static void assertGreaterEqual(int actual, int expected) {

        Assert.assertTrue(actual >= expected);

    }

    public static String generateRandomString(int count) {

        return RandomStringUtils.randomAlphabetic(count);

    }

    public static String generateRandomAlphaNumberic(int count) {
        return RandomStringUtils.randomAlphanumeric(count);
    }

    public static String waitForSec(int seconds) {

        int milliseconds = seconds * 1000;

        try {
            Thread.sleep(milliseconds);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        String s = "Wait Completed for : " + seconds + " seconds";

        return s;

    }

    public static String getMonth(int month) {

        String[] monthNames = {"jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"};

        return monthNames[month];

    }
    public static void printHashMapValues(HashMap<String, String> mapObj) {

        LogUtil.info("Calling Method : printHashMapValues() ");

        int counter = 1;

        for (Entry<String, String> entry : mapObj.entrySet()) {

            LogUtil.info("Entry #" + counter + " : " + entry.getKey() + " => " + entry.getValue());

            counter++;

        }

    }


    // replace all instances of trailing zeros like 123.0 to 123
    public static String removeTrailingZeros(String str) {

        return str.replaceAll("[.0]+$", "");

    }

    public static void assertValue(String actualValue, String expectedValue) {
        LogUtil.info("Actual Value : " + actualValue + " and Expected Value : " + expectedValue);
        Assert.assertEquals(actualValue, expectedValue);
    }

    public static void assertValue(int actualValue, int expectedValue) {
        LogUtil.info("Actual Value : " + actualValue + " and Expected Value : " + expectedValue);
        Assert.assertEquals(actualValue, expectedValue);
    }

    public static long getCurrentMilli() {

        Calendar calendar = Calendar.getInstance();

        long timeMilli = calendar.getTimeInMillis();

        return timeMilli;
    }

    public static void main(String[] args) {
        System.out.println(1<1);
    }
}