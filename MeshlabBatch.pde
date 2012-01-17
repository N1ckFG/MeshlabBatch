Data data;

//file specs
String fileName = "meshlab_batch";
String filePath = "";
String fileType = "txt";

//deets for batch
String frameworksPath = "/Applications/Meshlab/meshlab.app/Contents/Frameworks";
String applicationPath = "/Applications/Meshlab/meshlab.app/Contents/MacOS/meshlabserver";
String inputPath = "/Users/nick/Projects/Prior Art/02 production/plexus test 2/obj";
String inputName = "render_shot1_";
String inputType = "obj";
String outputPath = "/Users/nick/Projects/Prior Art/02 production/plexus test 2/output";
String outputName = "render_shot1_";
String outputType = "obj";
String scriptPath = "/Users/nick/Projects/Prior Art/02 production/plexus test 2";
String scriptName = "myscript";
String scriptType = "mlx";

int firstNum = 0;
int lastNum = 218;

void setup(){
}

void draw(){
data = new Data();
data.beginSave();
data.add("cd " + "\"" + frameworksPath + "\"");
data.add("\r");
for(int i=firstNum;i<lastNum+1;i++){
String inputString = " -i " + "\"" + inputPath + "/" + inputName + i + "." + inputType + "\"";
String outputString = " -o " + "\"" + outputPath + "/" + outputName + i + "." + outputType + "\"";
String scriptString = " -s " + "\"" + scriptPath + "/" + scriptName + "." + scriptType + "\"";

data.add("" + "\"" + applicationPath + "\"" + inputString + outputString + scriptString);
data.add("\r");
}
data.endSave("data/" + filePath + "/" + fileName + "." + fileType);
exit();
}

