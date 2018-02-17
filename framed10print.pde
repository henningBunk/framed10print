PGraphics output;
int scaleDownFactor = 20;

// All about the doors
float widthCM = 158.0;
float heightCM = 191.4;

int doors = 4;
float doorWidthCM = 37.8;
float doorGapCM = 2.27;

// Printing details
float bleedCM = 0.3;
float dpi = 300.0;

// Only motive related stuff
int grid = 11;
float strokeCM = 2.0;

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
    output.pixelDensity(3);
    output.beginDraw();

    noLoop();
    //Motive related
    output.background(36, 107, 97);
    output.stroke(107, 160, 153);
    output.strokeWeight(strokePixels);
    background(36, 107, 97);
    stroke(107, 160, 153);
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