package com.example.karate.controller;

import com.intuit.karate.junit5.Karate;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("api-karate")
public class KarateTest {
    @RequestMapping("/execute")
    public ResponseEntity<String> getTest() {
        return ResponseEntity.ok("hello karate framework");
    }

    @Karate.Test
    public Karate test() {
        return Karate.run("classpath:feature/post_examples.feature");
    }

}