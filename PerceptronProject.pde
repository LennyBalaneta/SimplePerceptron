Perceptron p;

Point[] points = new Point[100];

int ptIndex;

void setup() {
  size(400, 400);
  p = new Perceptron();
  
  //Initialize the training points
  for(int i=0 ; i<points.length ; i++) {
    points[i] = new Point();
  }
  ptIndex = 0;
}

void draw() {
  background(255);
  stroke(0);
  
  //The correct fucntion line and the points
  line(0, height, width, 0);
  for(Point pt : points) {
    pt.show();
  }
  
  //Train the Perceptron with 1 point
  Point pto = points[ptIndex];
  float[] input = {pto.x, pto.y};
  p.train(input, pto.label);
  
  //Print all the points:
  //Green -> correct classification
  //Red   -> incorrect classification
  for(Point pt : points) {
    float[] inputs = {pt.x, pt.y}; 
    int guess = p.guess(inputs);
    if(guess == pt.label) {
      fill(0, 255, 0);
    }else {
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(pt.pixelX(pt.xx), pt.y, 4, 4);
  }
  
  ptIndex++;
  if(ptIndex == points.length) {
    ptIndex = 0;
  }
  
  //Draw a line with the Perceptron weights
  //p.showWeights();
  p.drawGuessLine();
}