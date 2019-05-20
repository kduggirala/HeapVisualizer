class Node {
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

  private E setData(E new) {
    E old = data;
    data = new;
    return old;
  }

  private void setxcor(int x) {
    xcor = x;
  }

  private void setycor(int x) {
    xcor = x;
  }
  
}
