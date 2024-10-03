import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Assert;
import org.junit.Test;
import utils.EmailUtil;
import utils.ResourceLoader;

public class TestRunner {

    private static final int THREAD_COUNT = 1;

    @Test
    public void JUnitTestRunner() {
        Results results = Runner.path("classpath:")
                .tags(System.getProperty("karate.tag"))
                .parallel(THREAD_COUNT);

        generateReport(results);

        Assert.assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }

    private void generateReport(Results results) {
        try {
            ResourceLoader.loadProperties();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        System.out.println("Report Directory => " + results.getReportDir());
        String passedTestCases = String.valueOf(results.getScenariosPassed());
        String failedTestCases = String.valueOf(results.getFailCount());
        int total = results.getScenariosTotal();
        int divisionVar = (results.getScenariosPassed() * 100) / total;
        Float percentage = (float) (divisionVar);
        String environment = System.getProperty("karate.env");

        int timeTakenInSeconds = (int) ((results.getTimeTakenMillis()) / 1000);

        String timeTaken = String.valueOf(timeTakenInSeconds);

        System.out.println("TCs Passed : " + passedTestCases);
        System.out.println("TCs Failed : " + failedTestCases);
        System.out.println("Total Time Taken : " + results.getTimeTakenMillis());
     // Inside your test runner or setup
        System.out.println("TEST_DATA path: " + System.getProperty("karate.env"));


        EmailUtil.sendEmail(passedTestCases, failedTestCases, timeTaken, percentage, environment, "API Tests Result", "file://home/ashishsingh/Downloads/api-automation-karate1","/home/ashishsingh/Downloads/api-automation-karate1");
   
    }
}