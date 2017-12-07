final int boxSize = 40;
final int num = 25;
int Width = num * boxSize;
boolean isRunning = false;
Box[] boxes = new Box[num];
int[] tempBoxes = new int[num];

int t = 0;
int delay = 50;
int framerate;

void settings() {
  size(Width, boxSize + 50);
}

void setup() {
  background(255);
  for (int i = 0; i < num; i++) {
    boxes[i] = new Box(i, 0);
  }
}

void draw() {
  background(255);
  if (t % delay == 0) {
    framerate = (int)frameRate;
    if (isRunning) {
      for (int i = 0; i < num; i++) {
        tempBoxes[i] = boxes[i].ball;
      }
      for (int i = 0; i < num; i++) {
        boxes[i].calcState();
      }
    }
    t = 0;
  }
  t++;
  for (int i = 0; i < num; i++) {
    boxes[i].display();
  }

  fill(250, 0, 0);
  textAlign(LEFT);
  textSize(30);
  if (isRunning) {
    text("Run", 0, height - 10);
  } else {
    text("Stop", 0, height - 10);
  }
  textAlign(RIGHT);
  textSize(18);
  text("frameRate: " + framerate +" / " + delay, width - 10, height - 10);
}

void mouseClicked() {
  int cellColumn = (int)(mouseX / boxSize);
  if (cellColumn < boxes.length) {
    boxes[cellColumn].changeState();
  }
}

void mouseDragged() {
  int cellColumn = (int)(mouseX / boxSize);
  if (0 < mouseX && mouseX < Width && 0 < mouseY && mouseY < boxSize) {
    boxes[cellColumn].changeState();
  }
}

void keyReleased() {
  if (key == ' ') {
    isRunning = !isRunning;
  } else if (key == 'r' || key == 'R') {
    randomSetup();
  } else if (key == 'c' || key == 'C') {
    setup();
  } else if (keyCode == UP) {
    if (delay != 100) {
      delay += 10;
    }
  } else if (keyCode == DOWN) {
    if (delay != 10) {
      delay -= 10;
    }
  } else if (keyCode == ENTER) {
    printInfo();
  }
}

void randomSetup() {
  for (int i = 0; i < num; i++) {
    float coinSpeed = random(1);
    int coin;
    if (coinSpeed > 0.8) {
      coin = 1;
    } else {
      coin = 0;
    }
    boxes[i].ball = coin;
  }
}

void printInfo() {
  for (int i = 0; i < num; i++) {
    if (i == num - 1) {
      println(boxes[i].ball);
    } else {
      print(boxes[i].ball + ", ");
    }
  }
}