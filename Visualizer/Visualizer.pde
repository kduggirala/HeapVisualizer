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

class Heap<E> {
  Node<E>[] data;
  E pop(){return null;}
  void pushUp(){}
  void pushDown(){}
  void heapify(){}
  void clear(){}
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
