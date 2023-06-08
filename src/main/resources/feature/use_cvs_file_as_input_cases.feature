Feature: CSV Examples

  Background:
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * def randomGenerator =
    """
      function(min, max){
        min = Math.ceil(min);
        max = Math.floor(max);
        return Math.floor(Math.random() * (max - min + 1) + min); }
    """
    * def randomValue = randomGenerator(100, 500)


  Scenario Outline: use cvs file to test this case <testcase>,<desc>
    * print '<testcase> <desc>'
    * print randomValue
    * print sleep(randomValue)

    Examples:
      | read('templates/testdata.csv') |
