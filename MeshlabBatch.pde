Data data;

//file specs
String fileName = "meshlab_batch";
String filePath = "";
String fileType = "command";

//deets for batch
String frameworksPath = "/Applications/Meshlab/meshlab.app/Contents/Frameworks";
String applicationPath = "/Applications/Meshlab/meshlab.app/Contents/MacOS/meshlabserver";
String inputPath = "/Users/nick/Projects/Development/Processing/2012/kinect/pointcloud/Pointcloud_Render/render/shot1";
String inputName = "shot1_frame";
String inputType = "obj";
String outputPath = "/Users/nick/Projects/Development/Processing/2012/kinect/pointcloud/Pointcloud_Render/render/output";
String outputName = "render_shot1_";
String outputType = "obj";
String scriptPath = "/Applications/Meshlab/scripts";
String scriptName = "point_to_mesh";
String scriptType = "mlx";
String eol = "\n";  // usually \r ...but you need \n for unix shell scripts

int firstNum = 1;
int lastNum = 20;

void setup() {
}

void draw() {
  data = new Data();
  data.beginSave();
  data.add("#!/bin/bash" + eol);
  data.add("cd " + "\"" + frameworksPath + "\"" + eol);
  data.add("for i in {" + firstNum + ".." + lastNum + "}" + eol);
  data.add("do" + eol);

    String inputString = " -i " + "\"" + inputPath + "/" + inputName + "$i" + "." + inputType + "\"";
    String outputString = " -o " + "\"" + outputPath + "/" + outputName + "$i" + "." + outputType + "\"";
    String scriptString = " -s " + "\"" + scriptPath + "/" + scriptName + "." + scriptType + "\"";
    data.add("" + "\"" + applicationPath + "\"" + inputString + outputString + scriptString + eol);

  data.add("done" + eol);
  data.endSave("data/" + filePath + "/" + fileName + "." + fileType);
  exit();
}

