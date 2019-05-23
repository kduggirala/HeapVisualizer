class Node{
  private int data;
  int xcor;
  int ycor;
  Node(int value, int x, int y) {
    data = value;
    xcor = x;
    ycor = y;
  }
  private int getData() {
    return data;
  }

  private int setData(int newData) {
    int old = data;
    data = newData;
    return old;
  }

  void setxcor(int x) {
    xcor = x;
  }

  void setycor(int y) {
    ycor = y;
  }
  
  void display() {
    fill(235);
    ellipse(xcor, ycor, 60, 60);
    fill(0);
    textSize(30);
    text("" + data, xcor - 18, ycor + 15);
  }
}

class Heap {
  Node[] data;
  int size;
  boolean isMaxHeap;
  Heap() {
    data = new Node[63];
    size = 0;
    isMaxHeap = true;
  }
  
  Heap(boolean isMaxHeap) {
    data = new Node[63];
    size = 0;
    this.isMaxHeap = isMaxHeap;
  }

  int pop(){
    int popped = data[--size].getData();
    swap(0, size);
    data[size] = null;
    pushDown(0);
    return popped;
  }
  void add(int value) {
     data[size] = new Node(value, 0, 0);
     pushUp(size++);
  }
  private void swap(int index1, int index2) {
    int temp = data[index1].getData();
    data[index1].setData(data[index2].getData());
    data[index2].setData(temp);
  }
  int size() {return size;}
  void pushDown(int index){
    int child1Index, child2Index;
    int child1, child2, cur;
    while (index < size) {
      child1Index = (2 * index) + 1;
      child2Index = child1Index + 1;
      child1 = data[child1Index].getData();
      child2 = data[child2Index].getData();
      cur = data[index].getData();
      if (child2Index < size) {
        if (compareTo(child1, child2) > 0) {
          if (compareTo(child1, cur) > 0) {
            swap(child1Index, index);
            index = child1Index;
          }
          else {
            break;
          }
        }
        else {
          if (compareTo(child2, cur) > 0) {
            swap(child2Index, index);
            index = child2Index;
          }
          else {
            break;
          }
        }
      }
      else {
        if (child1Index < size) {
          if (compareTo(child1, cur) > 0) {
            swap(child1Index, index);
          }
          break;
        }
        else {
          break;
        }
      }
    }
    
  
  }
  void pushUp(int index){
    int parentIndex;
    int parent, cur;
      while (index > 0) {
        parentIndex = (index - 1) / 2;
        parent = data[parentIndex].getData();
        cur = data[index].getData();
        if (compareTo(cur, parent) > 0) {
          swap(index, parentIndex);
          index = parentIndex;
        }
        else {
          break;
        }
     }
  }
  void heapify() {
    heapifyHelp(0);
  }
      //- convert the array into a valid heap. [ should be O(n) ]
 void heapifyHelp(int index) {
    if (2 * index + 1 < size) { //if it is has children
      heapifyHelp(2 * index + 1);
      heapifyHelp(2 * index + 2);
      pushDown(index);
    }
  }
  
  void clear(){
    data = new Node[63];
    size = 0;
  }
  int compareTo(int e1, int e2) {    
    if (e1 > e2) {
       return isMaxHeap ? 1 : -1;
    }
    if (e2 > e1) {
      return isMaxHeap ? -1 : 1; 
    }
    else {return 0;}
  }
  
}

Heap heap;
Node test;
int t;
void draw(){
  background(255);
  test.setxcor((int) (test.xcor + (50 * cos(t))));
  test.setycor((int) (test.ycor + (50 * sin(t))));
  t += 1;
  test.display();
}
void setup(){
  heap = new Heap(true);
  size(1000, 800);
  test = new Node(10, 80, 100);
  test.display();
  t = 0;
}
void display(){
}
void clear(){heap.clear();}
void addValue(Integer i){heap.add(i);}
void removeValue() {heap.pop();}
void setHeapType(boolean isMaxHeap) {}
