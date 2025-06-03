import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class RunnerTest {

//    @Test
//    void testAllAvailable() {
//        Results results = Runner.path("classpath:tests/First.feature").outputCucumberJson(true).parallel(1);
//        assertEquals(0, results.getFailCount(), results.getErrorMessages());
//    }
//
//    @Karate.Test
//    Karate test() {
//        return Karate.run("tests/First").relativeTo(getClass());
//    }
//
//    @Karate.Test
//    Karate testAll() {
//        return Karate.run("tests/First", "tests/Second").relativeTo(getClass());
//    }

    @Karate.Test
    Karate testReqresInApis() {
        return Karate.run("tests/Test").relativeTo(getClass());
    }
}
