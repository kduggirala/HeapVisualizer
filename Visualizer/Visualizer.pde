
class Node{

  private int data;
  int xcor;
  int ycor;
  Node(int value, int x, int y) {
    data = value;
    xcor = x;
    ycor = y;
  }

  public int getData() {
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
  
  void setHeapType(boolean isMax) {
    isMaxHeap = isMax;
  }
  int pop() {
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
  int size() {
    return size;
  }
  void pushDown(int index) {
    int child1Index, child2Index, child1, child2, cur;
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
          } else {
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
        } else {
          break;
        }
      }
    }
  }
  void pushUp(int index) {
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


static int log(int x, int base) {
  if (x == 0) {
    return 0;
  }
  if (x == 1) {
    return 1;
  }
  return (int) (Math.log(x + 1) / Math.log(base));
}

int getxcor(int num) {
  int level = log(num, 2) + 1;
  int offset = 1;
  for (int i = (int) Math.pow(2, level - 1) - 1; i <num; i++ ) {
    offset += 2;
  } 
  return (int) ((offset * width) / (Math.pow(2, level)));
}

int getycor(int num) {
  int level = log(num, 2) + 1;
  int indent = (height - 12 * radius) / 7;
  return indent * level + radius * (2 * level - 1);
}

Heap heap;
int radius;
void setup() {
  size(1500, 1000);
  radius = 20;
  heap = new Heap();
  for (int k = 0; k < 10; k++) {
    heap.add(k);
  }
  Node[] data = heap.data;
  for (int i = 0 ;i < heap.size(); i++) {
    data[i].setxcor(getxcor(i));
    data[i].setycor(getycor(i));
  }
  
}

void draw() {
  background(51);
  Node[] data = heap.data;
  for (int i = 0; i < heap.size(); i++) {
    if (data[i] != null) {
      data[i].display();
    }
  }
}

void  display() {
  
}

void clear() {
}

void addValue(Integer i) {
  heap.add(i);
}

void removeValue() {
  heap.pop();
}

void setHeapType(boolean isMaxHeap) {
  heap.setHeapType(isMaxHeap);
}
