Feature: CSV Examples

  Scenario Outline: use cvs file to test this case <testcase>,<desc>
    * print '<testcase> <desc>'

    Examples:
      | read('templates/testdata.csv') |
