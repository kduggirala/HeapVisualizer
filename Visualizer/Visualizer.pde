class Node {
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

  private void setxcor(int x) {
    xcor = x;
  }

  private void setycor(int y) {
    ycor = y;
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
          } else {
            break;
          }
        } else {
          if (compareTo(child2, cur) > 0) {
            swap(child2Index, index);
            index = child2Index;
          } else {
            break;
          }
        }
      } else {
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
      } else {
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

  void clear() {
    data = (Node[]) new Object[63];
    size = 0;
  }
  int compareTo(int e1, int e2) {
    if (isMaxHeap) {
      //return e1.compareTo(e2);
      return e1 - e2;
    } else {
      return -1 * (e1 - e2);
    }
  }
}

//::::::: VISUALIZER:::::::::::::

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
  int indent = (width - 31 * radius) / 33;
  int center = width / 2;
  if (level % 2 == 0) {
    return width / 2 - num * indent;
  } else {
    return width / 2 + num * indent;
  }
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
  // Integer data set for heap
  int[] oldArray = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  //Integer[] newArray = new Integer[oldArray.length];
  //int i = 0;
  //for (int value : oldArray) {
  //  newArray[i++] = Integer.valueOf(value);
  //}
  heap = new Heap();
  for (int k = 0; k < oldArray.length; k++) {
    heap.add(oldArray[k]);
  }
}

void draw() {
  background(51);
  for (int i = 0; i < heap.size(); i++) {
    stroke(200);
    fill(255,0,0);
    circle(getxcor(i), getycor(i), radius);
    textSize(20);
    fill(0,0,0);
    text(i, getxcor(i), getycor(i));
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
}
