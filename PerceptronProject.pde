Perceptron p;

Point[] points = new Point[100];

int ptIndex;

void setup() {
  size(800, 800);
  p = new Perceptron(3);
  
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
  Point p0 = new Point(-1.0, f(-1.0));
  Point p1 = new Point(1.0, f(1.0));
  line(p0.pixelX(), p0.pixelY(), p1.pixelX(), p1.pixelY());
  for(Point pt : points) {
    pt.show();
  }
  
  //Train the Perceptron with 1 point
  Point trainingPto = points[ptIndex];
  float[] input = {trainingPto.x, trainingPto.y, trainingPto.bias};
  p.train(input, trainingPto.label);
  
  //Print all the points:
  //Green -> correct classification
  //Red   -> incorrect classification
  for(Point pt : points) {
    float[] inputs = {pt.x, pt.y, pt.bias}; 
    int guess = p.guess(inputs);
    if(guess == pt.label) {
      fill(0, 255, 0);
    }else {
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(pt.pixelX(), pt.pixelY(), 4, 4);
  }
  
  ptIndex++;
  if(ptIndex == points.length) {
    ptIndex = 0;
  }
  
  //Draw a line with the Perceptron weights
  //p.showWeights();
  p.drawGuessLine();
}