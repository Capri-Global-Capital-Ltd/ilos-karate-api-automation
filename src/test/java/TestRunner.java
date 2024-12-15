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
        Results results = Runner.path(
                // Feature paths
                "src/test/java/loanxpress/apis_1/login.feature",
                // "src/test/java/loanxpress/apis_1/master_data.feature",
                // "src/test/java/loanxpress/apis_1/open_listing.feature",
                // "src/test/java/loanxpress/apis_1/lead_detail.feature",
                // "src/test/java/loanxpress/apis_1/edit_lead.feature",
                // "src/test/java/loanxpress/apis_1/mark_section.feature",
                // "src/test/java/loanxpress/apis_1/submit_lead.feature",
                // "src/test/java/loanxpress/UW/uw_filter_assign_lead.feature",
                // "src/test/java/loanxpress/UW/uw_lead_detail.feature",
                // "src/test/java/loanxpress/UW/uw_filter_result_lead.feature",
                // "src/test/java/loanxpress/UW/uw_generate_form.feature",
                // "src/test/java/loanxpress/UW/uw_submit_lead.feature",
                // "src/test/java/loanxpress/UW/dedupe_lead_detail.feature",
                // "src/test/java/loanxpress/UW/search_customer.feature",
                // "src/test/java/loanxpress/UW/dedupe_submit_lead.feature",
                // "src/test/java/loanxpress/IPA_OBL/IPA_lead_detail.feature",
                // "src/test/java/loanxpress/IPA_OBL/IPA_OBL_submit.feature",

                "src/test/java/loanxpress/PD/pd_assign_lead.feature",
                "src/test/java/loanxpress/PD/pd_view_processor.feature",
                "src/test/java/loanxpress/PD/pd_view_leaddetail.feature",
                "src/test/java/loanxpress/PD/pd_lead_processor.feature",
                "src/test/java/loanxpress/PD/pd_lead_config.feature",
                "src/test/java/loanxpress/PD/pd_check_branch.feature",
                "src/test/java/loanxpress/PD/pd_save_request.feature",
                "src/test/java/loanxpress/PD/pd_submit_request.feature",
                "src/test/java/loanxpress/PD/pd_metadata_list.feature",
                "src/test/java/loanxpress/PD/pd_responses_verification.feature",
                "src/test/java/loanxpress/PD/pd_pdmeta_status.feature",
                "src/test/java/loanxpress/PD/pd_owner_login.feature",
                "src/test/java/loanxpress/PD/pd_responses_questionnaire.feature",
                "src/test/java/loanxpress/PD/pd_pdmeta_submit.feature",
                "src/test/java/loanxpress/PD/pd_application_positive.feature"

        ).tags(System.getProperty("karate.tag")).parallel(THREAD_COUNT); // Set to 1 for sequential execution

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
        Float percentage = (float) divisionVar;
        String environment = System.getProperty("karate.env");

        int timeTakenInSeconds = (int) ((results.getTimeTakenMillis()) / 1000);
        String timeTaken = String.valueOf(timeTakenInSeconds);

        System.out.println("TCs Passed : " + passedTestCases);
        System.out.println("TCs Failed : " + failedTestCases);
        System.out.println("Total Time Taken : " + results.getTimeTakenMillis());
        System.out.println("TEST_DATA path: " + System.getProperty("karate.env"));

        EmailUtil.sendEmail(
                passedTestCases, 
                failedTestCases, 
                timeTaken, 
                percentage, 
                environment, 
                "API Tests Result",
                "file://home/ashishsingh/Downloads/api-automation-karate1",
                "/home/ashishsingh/Downloads/api-automation-karate1"
        );
    }
}
