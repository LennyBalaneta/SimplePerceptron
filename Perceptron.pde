class Perceptron {
  float[] weights;
  float learningRate = 0.1;
  
  Perceptron(int n) {
    weights = new float[n];
    //Initialize the weights randomly
    for(int i=0 ; i<weights.length ; i++) {
      weights[i] = random(-1, 1);
    }
  }
  
  int guess(float[] inputs) {
    float sum = 0;
    for(int i=0 ; i<weights.length ; i++) {
      sum += inputs[i] * weights[i];
    }
    
    int output = sign(sum);
    return output;
  }
  
  //Refine the weights
  void train(float[] inputs, int target) {
    int guess = guess(inputs);
    
    int error = target - guess;
    
    for(int i=0 ; i<weights.length ; i++) {
      weights[i] += error * inputs[i] * learningRate;
    }
  }
  
  
  //Show the perceptron weights
  void showWeights() {
    for(float w : weights) {
      print(w + " | ");
    }
      print("\n");
  }
  
  float guessY(float x) {
    //f = ax + b
    float w0 = weights[0];
    float w1 = weights[1];
    float w2 = weights[2];
    return -(w2/w1) - (w0/w1) * x;
  }
  
  //Draw a line with the perceptron weights
  //Formula: weights[0]*x + weights[1]*y = 0
  void drawGuessLine() {
    /*float x0 = 0;
    float x1 = width;
    float y0 = -(weights[0] * x0) / weights[1];
    float y1 = -(weights[0] * x1) / weights[1];
    stroke(0, 0, 255);
    line(x0, y0, x1, y1);*/
    stroke(0, 0, 255);
    Point p0 = new Point(-1.0, guessY(-1.0));
    Point p1 = new Point(1.0, guessY(1.0));
    line(p0.pixelX(), p0.pixelY(), p1.pixelX(), p1.pixelY());
  }
  
}

//Activation function
int sign(float n) {
  if(n >= 0) {
    return 1;
  }else{
    return -1;
  }
}