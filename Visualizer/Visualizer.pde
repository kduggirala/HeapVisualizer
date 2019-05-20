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
  }
  
  E pop(){
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
  int size() {return size;}
  void pushDown(int index){
    int child1Index, child2Index;
    E child1, child2, cur;
    while (index < size) {
      child1Index = (2 * index) + 1;
      child2Index = child1Index + 1;
      child1 = data[child1Index].getData();
      child2 = data[child2Index].getData();
      cur = data[index].getData();
      if (child2Index < size) {
        if (child1.compareTo(child2) > 0) {
          if (child1.compareTo(cur) > 0) {
            swap(child1Index, index);
            index = child1Index;
          }
          else {
            break;
          }
        }
        else {
          if (child2.compareTo(cur) > 0) {
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
          if (child1.compareTo(cur) > 0) {
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
    E parent, cur;
      while (index > 0) {
        parentIndex = (index - 1) / 2;
        parent = data[parentIndex].getData();
        cur = data[index].getData();
        if (cur.compareTo(parent) > 0) {
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
    data = (Node<E>[]) new Object[63];
    size = 0;
  }
  int compareTo(E e1, E e2){
    if (isMaxHeap) {
      return e1.compareTo(e2);
    }
    else {
      return -1 * e1.compareTo(e2);
    }
  }
  
}

Heap<Integer> heap;
void draw(){}
void setup(){}
void  display(){}
void clear(){}
void addValue(Integer i){heap.add(i);}
void removeValue() {heap.pop();}
void setHeapType(boolean isMaxHeap) {}
