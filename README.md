# HeapVisualizer

## Description

## How To Run

  Download the pde file named Visualizer.pde and compile and run that file. Press the enter key to add values to the heap, and press the delete key to clear the heap. Clicking on the box labeled "pop" removes the top value of the heap and clicking the box labeled "switch heap type" switches the heap from a min heap to a max heap and vice versa. Clicking on a node in the heap removes that value from the heap. While objects are moving within the heap, do not add new values, remove values, or attempt to change the type of heap.

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

      Selecting and deselecting node works

  June 4:

  Kiran:

    Fixed highlighting when the nodes are swapped
