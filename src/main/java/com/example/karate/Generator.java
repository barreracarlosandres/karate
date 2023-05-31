package com.example.karate;

import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.RandomUtils;

@UtilityClass
public class Generator {

  public Integer getRandomNumber() {
      return RandomUtils.nextInt(0,10);
  }

}
