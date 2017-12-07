class Box {
  int pos;
  int num;
  int ball;

  Box (int num, int ball) {
    this.pos = num * boxSize;
    this.num = num;
    this.ball = ball;
  }
  
  void changeState() {
    if (ball == 1) {
      this.ball = 0;
    }else {
      this.ball = 1;
    }
  }
  
  void calcState() {
    int countPast = 0;
    int countNext = 0;
    for (int i = 0; i < this.num; i++) {
      if (boxes[i].ball == 1) {
        countNext++;
      }
      if (tempBoxes[i] == 1) {
        countPast++;
      }
    }
    this.ball = min(countPast - countNext, 1 - this.ball);
  }

  void display() {
    fill(255);
    rect(pos, 0, boxSize, boxSize);
    fill(0);
    if (ball == 1) {
      ellipse(pos + boxSize / 2, boxSize / 2, boxSize * 2/3, boxSize * 2/3);
    }
  }
}