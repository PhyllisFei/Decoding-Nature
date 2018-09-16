ArrayList<Branch> tree;
ArrayList<Leaf> leaves;

void setup() {
  size(800, 640);
  background(255);
  // Setup the arraylist and add one branch to it
  tree = new ArrayList<Branch>();
  leaves = new ArrayList<Leaf>();
  // A branch has a starting position, a starting "velocity", and a starting "timer" 
  Branch b = new Branch(new PVector(width/2, height), new PVector(0, -2), 110);
  // Add to arraylist
  tree.add(b);
}

void draw() {
  background(255);
  strokeWeight(4);

  // Let's stop when the arraylist gets too big
  // For every branch in the arraylist
  for (int i = tree.size()-1; i >= 0; i--) {
    // Get the branch, update and draw it
    Branch b = tree.get(i);
    b.update();
    b.render();
    // If it's ready to split
    if (b.timeToBranch()) {
      if (tree.size() < 1024) {
        //tree.remove(i);             // Delete it
        tree.add(b.branch( 70));   // Add one going right
        tree.add(b.branch(-35));   // Add one going left
      } else {
        leaves.add(new Leaf(b.end));
      }
    }
  }

  for (Leaf leaf : leaves) {
    leaf.update();
    leaf.display();
  }
}
