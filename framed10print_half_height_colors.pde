PGraphics output;
int scaleDownFactor = 10;

// All about the doors
float widthCM = 79;
float heightCM = 95.4;

int doors = 2;
float doorWidthCM = 37.8;
float doorGapCM = 2.9;

// Printing details
float bleedCM = 0.3;
float dpi = 300.0;

// Only motive related stuff
int grid = 15;
float strokeCM = 1.0;

int strokePixels = getPixels(strokeCM);
int widthPixels = getPixels(widthCM  + 2 * bleedCM + 1 * strokeCM);
int heightPixels = getPixels(heightCM + 2 * bleedCM + 1 * strokeCM);

int unit = int (widthPixels / grid);
int unitsHorizontal = grid;
int unitsVertical = heightPixels / (widthPixels / unit);

void settings(){
    // Scaled down output for the monitor
    size(widthPixels / scaleDownFactor, heightPixels / scaleDownFactor);
}

void setup(){
    output = createGraphics(widthPixels, heightPixels, JAVA2D);
    //output.pixelDensity(3);
    output.beginDraw();
    
    strokeCap(PROJECT);
    output.strokeCap(PROJECT);

    noLoop();
    //Motive related
    output.background(0, 0, 0);
    output.stroke(32, 32, 32);
    output.strokeWeight(strokePixels);
    background(0, 0, 0);
    stroke(32, 32, 32);
    strokeWeight(strokePixels / scaleDownFactor);
}

void draw(){
    //Motive related
    drawSlashes();
    
    //Outpud related
    saveDoors();
    output.endDraw();
    output.save("output.tif");
}

void saveDoors(){
    int printDoorWidthCM = getPixels(doorWidthCM + 2 * bleedCM);
    int printDoorHeighthCM = getPixels(heightCM + 2 * bleedCM);
    int topLeftY = getPixels(strokeCM - bleedCM);

    for (int i = 1; i <= doors; i++){
        int topLeftX = getPixels(strokeCM - bleedCM + ((i - 1) * (doorWidthCM + doorGapCM - (2 * bleedCM) )));
        PImage door = output.get(topLeftX, topLeftY, printDoorWidthCM, printDoorHeighthCM);
        door.save("door" + i + ".tif");
    }
}

int getPixels(float cm){
    float dpi = 300.0;
    float cmInInch = 2.54;
    return int(dpi * cm / cmInInch );
}

void drawSlashes(){
    for(int y = 0; y < unitsVertical; y++) {
        for(int x = 0; x < unitsHorizontal; x++) {
           float r = random(0, 1);
           
           float r2 = random(0,1);
           
           if(r2 < 0.2f) {
             stroke(63, 186, 80); //green
             output.stroke(63, 186, 80); //green
           } else if(r2 < 0.4f) {
                        stroke(56, 139, 252); //blue
                        output.stroke(56, 139, 252); //blue
           } else if(r2 < 0.6f) {
                        stroke(219, 55, 51); //red
                        output.stroke(219, 55, 51); //red
           } else if(r2 < 0.8f) {
                 stroke(240, 136, 62); //orange
                 output.stroke(240, 136, 62); //orange
           } else {
                        stroke(137, 87, 229); //purple
                        output.stroke(137, 87, 229); //purple
           }
           
           if(r < 0.5f) {
               drawBackSlash(x, y);
           } else {
               drawForwardSlash(x, y);
           }
        }
    }
}

void drawForwardSlash(int x, int y) {
    int fromX = x * unit;
    int fromY = (y+1) * unit;
    int toX =   (x+1) * unit;
    int toY =   y * unit;

    output.line(fromX, fromY, toX, toY);
    line(fromX / scaleDownFactor,
         fromY / scaleDownFactor,
         toX / scaleDownFactor,
         toY / scaleDownFactor);
}

void drawBackSlash(int x, int y) {
    int fromX = x * unit;
    int fromY = y * unit;
    int toX =   (x+1) * unit;
    int toY =   (y+1) * unit;

    output.line(fromX, fromY, toX, toY);
    line(fromX / scaleDownFactor,
         fromY / scaleDownFactor,
         toX / scaleDownFactor,
         toY / scaleDownFactor);
}
