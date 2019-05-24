int state = 0; 
String result=""; 
 
void setup() { 
  size(800, 800);
}
 
void draw() { 
 
 
  background(255); 
 
 
  switch (state) {
  case 0:
    fill(0); 
    text ("Please enter something and hit enter to go on \n"+result, 133, 333); 
    break;
 
  case 1:
    fill(255, 2, 2); 
    text ("Thanks \n"+result, 133, 633); 
    break;
  }
}
 
void keyPressed() {
 
  if (key==ENTER||key==RETURN) {
 
    state++;
  } 
  else if (key==SHIFT) {
    state--;
  }
  else if (key==BACKSPACE) {
    result = result.substring(0, result.length() - 1);
  }
  else {
    result = result + key;
  }
}
