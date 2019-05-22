class Node<E> {
  private E data;
  int xcor;
  int ycor;
  Node(E value, int x, int y) {
    data = value;
    xcor = x;
    ycor = y;
  }
  private E getData() {
    return data;
  }

  private E setData(E newData) {
    E old = data;
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

class Heap<E extends Comparable<E>> {
  Node<E>[] data;
  int size;
  boolean isMaxHeap;
  Heap() {
    data = (Node<E>[]) new Object[63];
    size = 0;
    isMaxHeap = true;
  }

  Heap(boolean isMaxHeap) {
    data = (Node<E>[]) new Object[63];
    size = 0;
    this.isMaxHeap = isMaxHeap;
  }

  E pop() {
    E popped = data[--size].getData();
    swap(0, size);
    data[size] = null;
    pushDown(0);
    return popped;
  }
  void add(E value) {
    data[size] = new Node<E>(value, 0, 0);
    pushUp(size++);
  }
  private void swap(int index1, int index2) {
    E temp = data[index1].getData();
    data[index1].setData(data[index2].getData());
    data[index2].setData(temp);
  }
  int size() {
    return size;
  }
  void pushDown(int index) {
    int child1Index, child2Index;
    E child1, child2, cur;
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
    E parent, cur;
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
    data = (Node<E>[]) new Object[63];
    size = 0;
  }
  int compareTo(E e1, E e2) {
    if (isMaxHeap) {
      return e1.compareTo(e2);
    } else {
      return -1 * e1.compareTo(e2);
    }
  }
}


//::::::: VISUALIZER:::::::::::::::

static int log(int x, int base) {
  return (int) (Math.log(x) / Math.log(base));
}

static int getxcor(int num) {
  return 0;
}

static int getycor(int num) {
  return 0;
}


Heap<Integer> heap;
int radius;
void setup() {
  size(1000, 800);
  radius = 10;
  // Integer data set for heap
  int[] oldArray = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  Integer[] newArray = new Integer[oldArray.length];
  int i = 0;
  for (int value : oldArray) {
    newArray[i++] = Integer.valueOf(value);
  }
  
  heap = new Heap<Integer>();
  for (int k = 0; k < newArray.length; k++) {
    heap.add(newArray[k]);
  }
}

void draw() {
  for (int i = 0; i < heap.size(); i += 2) {
    stroke(200);
    circle(getxcor(i), getycor(i), radius);
  }
  for (int i = 1; i < heap.size(); i += 2) {
    stroke(200);
    circle(getxcor(i), getycor(i), radius);
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
