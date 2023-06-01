package com.example.karate.utils;

import org.apache.commons.lang3.RandomUtils;

public class Generator {

  public static String getRandomNumber() {
    return String.valueOf(RandomUtils.nextInt(1, 2));
  }

}
