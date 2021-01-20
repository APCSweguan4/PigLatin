public void setup() 
{
  String[] lines = loadStrings("words.txt");
  System.out.println("There are " + lines.length + " lines:");
  for (int i = 0; i < lines.length; i++) 
  {
    System.out.println(pigLatin(lines[i]));
  }
  System.out.println("~~~~~~~~~~~~~~~~~");
  String[] hymn = loadStrings("LowellHymn.txt");
  System.out.println("There are " + hymn.length + " lines:");
  for (int i = 0; i < hymn.length; i++) 
  {
    ArrayList<String> hymnWords = new ArrayList<String>();
    if(hymn[i].length() > 0 && hymn[i].substring(hymn[i].length() - 1).equals(" ") == false) {
      hymn[i] = hymn[i] + " ";  
    }
    toWords(hymn[i], hymnWords);
    System.out.println(PigLatinList(hymnWords));
  }
}
public void draw()
{
  //not used
}
public int findFirstVowel(String sWord)
  //precondition: sWord is a valid String of length greater than 0.
  //postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  if (sWord.length() > 0 && (sWord.equals(",") || sWord.equals("."))) {
    return -2;
  }
  if (sWord.length() > 0) {
    for (int i = 0; i < sWord.length(); i++) {
      if (sWord.substring(i, i + 1).toLowerCase().equals("a") || sWord.substring(i, i + 1).toLowerCase().equals("e") || sWord.substring(i, i + 1).toLowerCase().equals("i") || sWord.substring(i, i + 1).toLowerCase().equals("o") || sWord.substring(i, i + 1).toLowerCase().equals("u")) {
        return i;
      }
    }
  }
  return -1;
}

public String pigLatin(String sWord)
  //precondition: sWord is a valid String of length greater than 0
  //postcondition: returns the pig latin equivalent of sWord
{
  if (findFirstVowel(sWord) == -2) {
    return sWord;
  } else if (findFirstVowel(sWord) == -1)
  {
    return sWord + "ay";
  } else if (findFirstVowel(sWord) == 0) {
    return sWord + "way";
  } else if (sWord.substring(0, 2).equals("qu")) {
    return sWord.substring(2) + sWord.substring(0, 2) + "ay";
  } else if (findFirstVowel(sWord) > 0) {
    return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
  } else
  {
    return "ERROR!";
  }
}

public void toWords(String text, ArrayList<String> list) {
  int start = 0;
  for (int i = 0; i < text.length(); i++) {
    if ((i < text.length() - 1) && (text.substring(i, i + 1).equals(" ") || text.substring(i, i + 1).equals(",") || text.substring(i, i + 1).equals("."))) {  
      list.add(text.substring(start, i));
      start = i + 1;
    }
    if (text.substring(i, i + 1).equals(",")) {
      list.add(",");
    } 
    if (text.substring(i, i + 1).equals(".")) {
      list.add(".");
    }
  }
}

public String PigLatinList(ArrayList<String> list) {
  String temp = new String();
  for (int i = 0; i < list.size(); i++) {
    if (i == 0) {
      String temp2 = pigLatin(list.get(i)).substring(0, 1).toUpperCase();
      String temp3 = pigLatin(list.get(i)).substring(1).toLowerCase();
      temp = temp + temp2 + temp3 + " ";
    } else if (list.get(i).equals("Lowell") || list.get(i).equals("High")) {
      String temp2 = pigLatin(list.get(i)).substring(0, 1).toUpperCase();
      String temp3 = pigLatin(list.get(i)).substring(1).toLowerCase();
      if ((list.get(i).equals("Lowell") && i == list.size() - 2)|| list.get(i).equals("High")) {
        temp = temp + temp2 + temp3;
      } else {
        temp = temp + temp2 + temp3 + " ";
      }
    } else {
      if ((i + 1) < list.size() && (list.get(i + 1).equals(",") || list.get(i + 1).equals("."))) {
        temp = temp + pigLatin(list.get(i));
      } else {
        temp = temp + pigLatin(list.get(i)) + " ";
      }
    }
  }
  return temp;
}
