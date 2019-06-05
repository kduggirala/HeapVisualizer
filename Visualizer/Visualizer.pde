import javax.swing.JOptionPane;
import java.util.*;
class Node {
  private int data;
  int xcor;
  int ycor;
  boolean selected;
  Node(int value, int x, int y) {
    data = value;
    xcor = x;
    ycor = y;
    selected = false;
  }

  public int getData() {
    return data;
  }

  private int setData(int newData) {
    int old = data;
    data = newData;
    return old;
  }

  int getxcor() {
    return xcor;
  }

  int getycor() {
    return ycor;
  }

  void setxcor(int x) {
    xcor = x;
  }

  void setycor(int y) {
    ycor = y;
  }
  
  void select() {
    selected = true;
  }
  
  void deselect() {
    selected = false;
  }
  void display() {
    if (selected == false) {
      fill(235);
      strokeWeight(1); 
      stroke(0, 0, 0); 
      ellipse(xcor, ycor, 70, 70);
      fill(0);
      strokeWeight(1);
      stroke(0, 0, 0);
      textSize(30);
      text("" + data, xcor - 21, ycor + 10);
    } 
    else {
      fill(235);
      strokeWeight(5); 
      stroke(255, 0, 0); 
      ellipse(xcor, ycor, 70, 70);
      fill(0);
      strokeWeight(1);
      stroke(0, 0, 0);
      textSize(30);
      text("" + data, xcor - 21, ycor + 10);
    }
  }
}

class Heap {
  Node[] nodes;
  private int[] data;
  int size;
  boolean isMaxHeap;
  Heap() {
    nodes = new Node[63];
    data = new int[63];
    size = 0;
    isMaxHeap = true;
  }

  Heap(boolean isMaxHeap) {
    this();
    this.isMaxHeap = isMaxHeap;
  }

  void switchHeapType() {
    isMaxHeap = !isMaxHeap;
    heapify();
  }
  int pop() {
    return remove(0);
  }
  int remove(int i) {
    if (size > 0) {
      int popped = data[i];
      swapNodes(i, size - 1);
      swap(i, --size);
      data[size] = 0;
      nodes[size] = null;
      pushDown(i);
      frame = frameCount;
      return popped;
    }
    return 0;
  }
  
  void add(int value) {
    Node n = new Node(value, getxcor(size), getycor(size));
    nodes[size] = n;
    data[size] = value;
    pushUp(size++);
    frame = frameCount;
  }
  void swap(int index1, int index2) {
    int temp = data[index1];
    data[index1] = data[index2];
    data[index2] = temp;
  }
  void swapNodes(int index1, int index2) {
    int temp = nodes[index1].getData();
    nodes[index1].setData(nodes[index2].getData());
    nodes[index2].setData(temp);
  }
  int size() {
    return size;
  }
  
  void pushDown(int index) {
    int child1Index, child2Index, child1, child2;
    int curIndex = index;
    int cur = data[index];
    while (curIndex < size) {
      child1Index = (2 * curIndex) + 1;
      child2Index = child1Index + 1;
      if (child2Index < size) {
        child1 = data[child1Index];
        child2 = data[child2Index];
        if (compareTo(child1, child2) > 0) {
          if (compareTo(child1, cur) > 0) {
            int[] pair = {child1Index, curIndex};
            pairsToSwap.add(pair);
            swap(child1Index, curIndex);
            curIndex = child1Index;
          } 
          else {
            break;
          }
        } 
        else { 
          if (compareTo(child2, cur) > 0) {
            int[] pair = {child2Index, curIndex};
            pairsToSwap.add(pair);
            swap(child2Index, curIndex);
            curIndex = child2Index;
          } 
          else {
            break;
          }
        }
      } 
      else {
        if (child1Index < size) {
          child1 = data[child1Index];
          if (compareTo(child1, cur) > 0) {
            int[] pair = {child1Index, curIndex};
            pairsToSwap.add(pair);
            swap(child1Index, curIndex);
          }
          break;
        } 
        else {
          break;
        }
      }
    }
  }
  void pushUp(int index) {
    int parentIndex, parent;
    int curIndex = index;
    int cur = data[index];
    while (curIndex > 0) {
      parentIndex = (curIndex - 1) / 2;
      parent = data[parentIndex];
      cur = data[curIndex];
      if (compareTo(cur, parent) > 0) {
        int[] pair = {curIndex, parentIndex};
        pairsToSwap.add(pair);
        swap(curIndex, parentIndex);
        curIndex = parentIndex;
      } 
      else {
        break;
      }
    }
  }
  void heapify() {
    heapifyHelp(0);
    frame = frameCount;
  }
  //- convert the array into a valid heap. [ should be O(n) ]
  void heapifyHelp(int index) {
    if (index < size) { //if it is in heap
      heapifyHelp((2 * index) + 1);
      heapifyHelp((2 * index) + 2);
      pushDown(index);
    }
  }

  void clear() {
    nodes = new Node[63];
    data = new int[63];
    size = 0;
  }
  int compareTo(int e1, int e2) {    
    if (e1 > e2) {
      return isMaxHeap ? 1 : -1;
    }
    if (e2 > e1) {
      return isMaxHeap ? -1 : 1;
    } else {
      return 0;
    }
  }
  
  private int getxcor(int num) {
    int level = log(num, 2) + 1;
    int offset = 1;
    for (int i = (int) Math.pow(2, level - 1) - 1; i <num; i++ ) {
      offset += 2;
    }  
    return (int) ((offset * width) / (Math.pow(2, level)));
  }

  private int getycor(int num) {
    int level = log(num, 2) + 1;
    int indent = (height - 12 * radius) / 7;
    return indent * level + radius * (2 * level - 1);  
  }
  void display() {
    for (int i = 0; i < size; i++) {
      nodes[i].display();
    }
    drawline();
  }
 private void drawline() {
  for (int i = 1; i < heap.size(); i++) {
    if (i % 2 == 1) {
      line(getxcor(i), getycor(i), getxcor(i/2), getycor(i/2));
    } 
    else {
      line(getxcor(i), getycor(i), getxcor(i/2 - 1), getycor(i/2 - 1));
    }
  }
}
}

static int log(int x, int base) {
  if (x == 0) {
    return 0;
  }
  if (x == 1) {
    return 1;
  }
  return (int) (Math.log(x + 1) / Math.log(base));
}



Heap heap;
int radius;
int capacity;
int lastRemoved;
int selectednode;
LinkedList<int[]> pairsToSwap;
int[] pair;
int frame;
void setup() {
  size(1500, 1000);
  radius = 20;
  heap = new Heap(true);

  for (int k = 0; k < capacity; k++) {
    heap.add((int) (random(100)));
  }
  
  pairsToSwap = new LinkedList<int[]>();
}

void draw() {
  background(180);
  
  heap.display();
  
  fill (255);
  rect(80, 900, 120, 60);
  fill(0);
  textSize(30);
  text("pop", 100, 940);
  
  fill (255);
  rect(280, 900, 270, 60);
  fill(0);
  textSize(30);
  text("removed: " + lastRemoved, 300, 940);
  
  fill (255);
  rect(700, 900, 270, 60);
  fill(0);
  textSize(30);
  text("switch heap type", 720, 940);
  
  if (pairsToSwap.size() > 0) {
      
      if ((frameCount - frame) % 70 == 10) {   
        pair = pairsToSwap.peekFirst();
        heap.nodes[pair[0]].select();
        heap.nodes[pair[1]].select();
      }
      if ((frameCount - frame) % 70 == 35) {
        heap.swapNodes(pair[0], pair[1]);
      }
      if ((frameCount - frame) % 70 == 55) { 
        heap.nodes[pair[0]].deselect();
        heap.nodes[pair[1]].deselect();
        pairsToSwap.removeFirst();
      }
  }
}



void mousePressed() {
  if (Math.abs(mouseX - 140) <= 60 && Math.abs(mouseY - 930) <= 30) {
    lastRemoved = heap.pop();
  }
  if (Math.abs(mouseX - 835) <= 135 && Math.abs(mouseY - 930) <= 30) {
    heap.switchHeapType();
  }  
  if (mouseinnode(mouseX, mouseY)) {
    lastRemoved = heap.remove(selectednode);
   
  }
}

boolean mouseinnode(int x, int y) {
  for (int i = 0; i < heap.size(); i++) {
    if (Math.abs(x - heap.nodes[i].getxcor()) < radius * 2 && Math.abs(y - heap.nodes[i].getycor()) < radius * 2) {
      selectednode = i;
      return true;
    }
  }
  return false;
}

void keyPressed() {
  if (key == ENTER) {
    int i = 0;
    String r = JOptionPane.showInputDialog(null, "What number?", "Decide", JOptionPane.QUESTION_MESSAGE);
    try {
      i = Integer.parseInt(r);
      heap.add(i);
    } 
    catch(NumberFormatException e) {
      println("you did not enter a number!");
    }
  }
  if (key == DELETE){
    heap.clear();
  }
}
