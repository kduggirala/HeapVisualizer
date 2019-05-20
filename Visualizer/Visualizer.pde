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

  private void setycor(int x) {
    xcor = x;
  }
  
}

class Heap<E extends Comparable<E>> {
  Node<E>[] data;
  int size;
  Heap() {
    data = (Node<E>[]) new Object[63];
    size = 0;
  }
  
  E pop(){return null;}
  void add(E value) {
     data[size++] = new Node<E>(value, 0, 0);
     
  }
  private void swap(int index1, int index2) {
    Node<E> temp = data[index1];
    data[index1] = data[index2];
    data[index2] = temp;
  }
  void pushUp(){
    int child1, child2;
    while (index < size) {
      child1 = (2 * index) + 1;
      child2 = child1 + 1;
      if (child2 < size) {
        if (data[child1] > data[child2]) {
          if (data[child1] > data[index]) {
            swap(data, child1, index);
            index = child1;
          }
          else {
            break;
          }
        }
        else {
          if (data[child2] > data[index]) {
            swap(data, child2, index);
            index = child2;
          }
          else {
            break;
          }
        }
      }
      else {
        if (child1 < size) {
          if (data[child1] > data[index]) {
            swap(data, child1, index);
          }
          break;
        }
        else {
          break;
        }
      }
    }
    
  
  }
  void pushDown(){
  int parent;
    while (index > 0) {
      parent = (index - 1) / 2;
      if (data[index] > data[parent]) {
        swap(data, index, parent);
        index = parent;
      }
      else {
        break;
      }
    }
  }
  void heapify(){}
  void clear(){
    data = null;
  }
  void compareTo(){}
  
}

Heap<Integer> heap;
void draw(){}
void setup(){}
void  display(){}
void clear(){}
void addValue(Integer i){heap.add(i);}
void removeValue() {heap.pop();}
void setHeapType(boolean isMaxHeap) {}
