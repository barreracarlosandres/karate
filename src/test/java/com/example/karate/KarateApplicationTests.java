package com.example.karate;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class KarateApplicationTests {

	@Test void testParallel() {
		Results results = Runner.path("classpath:feature").tags("~@ignore").parallel(5);
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
	}

}
