# HeapVisualizer

## Description

  This is a visualization that allows the user to see the structure and mechanics of a heap. It consists of a maximum of 31 nodes (circles of radius 50 pixels) that display data of type int. The heap allows users to add ints into the heap and remove them from the heap, and allows them to switch between a min and max heap. While these operations are happening, the speed is slowed to show the pushUp, pushDown, and heapify algorithms as they occur. As nodes are swapped within the heap, they are highlighted to show the algorithm at work. This allows the user to see and learn how the heap algorithms work.

## How To Run

  1. Download the pde file named Visualizer.pde and compile and run that file.
  2. Press the enter key to add values to the heap, and press the delete key to clear the heap.
  3.
    - Clicking on the box labeled "pop" removes the top value of the heap
    - Clicking the box labeled "switch heap type" switches the heap from a min heap to a max heap and vice versa.
    - Clicking on a node in the heap removes that value from the heap.
    - While objects are moving within the heap, do not add new values, remove values, or attempt to change the type of heap.

## Developement Log

  May 20:

   Kiran:

          Copied and adapted code for pushUp and pushDown from the heap lab
          Added most heap methods including add, pop, clear, and heapify

   Minuk:

          Added node class and wrote some mutator methods

  May 21:

   Kiran:

          Finished making heap by adding isMaxHeap boolean
          Error arose from use of generics in the Node class -> changed to only int

   Minuk:

          Started working on calculating the coordinates of nodes

  May 22:

   Kiran:

          Created display method for Nodes that creates a white circle with int inside

   Minuk:

          Started draw method to display the nodes
          Created getxcor and getycor to calculate where the xcor and ycor of the node should be
          getxcor incorrect -> all the nodes on one level squished together

  May 23:

   Kiran:

          Modified draw method to use Node display method
          Fixed getxcor to space nodes out correctly

   Minuk:

          Started drawline method to draw lines between nodes

  May 24:

   Kiran:

          Fixed pop method, created mechanism for user to remove values
          Displayed removed value on screen
          Found code for inputing number of processing forum(user Chrisir) and experimented with and modified it

  May 27:

   Minuk:

          Finished drawline method
          Allowed user input by pressing enter

  May 28:

  Kiran:

        Stuck trying to get animation working

   Minuk:

        Allowed clearing the heap by pressing delete key
        Stuck figuring out how to select node with mouse click

  May 29:

  Kiran:

      Moved display into heap to start animation

  May 30:

  Kiran:

      Fixed heap methods to make animation working

  Minuk:

      Working on highlighting the node

  May 31:

  Kiran:

      Decoupled animation from data

  Minuk:

      Implemented the highlighting method in mousepressed
      Error arose from selecting the node --> text inside node isn't displayed when selected

  June 1:

  Minuk:

      Fixed the error of yesterday and highlighting node when clicked

  June 4:

  Kiran:

    Fixed highlighting when the nodes are swapped
