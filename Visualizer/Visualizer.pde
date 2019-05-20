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
    E temp = data[index1].getData();
    data[index1].setData(data[index2].getData());
    data[index2].setData(temp);
  }
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
