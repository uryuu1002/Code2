class BlockSystem {
  ArrayList <Block> blocks;

  BlockSystem() {
    blocks = new ArrayList <Block>();
  }

  void addBlock() {
    blocks.add(new Block());
    for (int i = 0; i < blocks.size(); i++) {
      Block b = blocks.get(i);
      b.show();
    }
  }

//  void blockStatus() {    
//    for (int i = 0; i < blocks.size(); i++) {
//      Block b = blocks.get(i);
//      float d = dist (ball.x, ball.y, b.x, b.y);
//       if (d < ball.r) {
//        blocks.remove(i);
//      }
//    }
//  }
//}
