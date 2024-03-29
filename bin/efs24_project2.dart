import 'package:efs24_project2/efs24_project2.dart';

void main(List<String> arguments) {

  var add16RAM = upgradeRAM(16);


  // Using different constructors
  PC pc1 = PC(
      price: 2000,
      graphicCard: "NVIDIA 3060 RTX",
      processor: "Intel Core i5",
      ram: 8,
      motherboard: "ASUS B450");
  print("PC CREATED");
  pc1.printInfo();

  PC pc2 = PC.init();
  print("PC CREATED");
  pc2.printInfo();

  PC pc3 = PC.basicPC();
  print("PC CREATED");
  pc3.printInfo();

  PC pc4 = PC.manualInput();
  print("PC CREATED");
  pc4.printInfo();

  // Using method to show MAP collection
  print("=== JSON OUTPUT ===");
  print(pc1.toJSON());
  print(pc3.toJSON());

  // Using method to show SET collection
  pc2.installProgram("Minecraft");
  pc2.installProgram("Valorant");
  pc2.installProgram("MASS EFFECT");

  // Using method to show List collection
  pc2.installComponent("Audio Card with very cool sound");
  pc2.installComponent("WiFi Module");
  print("=== Installed programs and components ===");
  pc2.printInfo();

  // Showing Assert
  assert(pc2.installedPrograms.contains("Minecraft"));
  assert(pc2.installedPrograms.contains("Valorant"));

  // Using замикаюча функція
  print("=== Upgrade ram ===");  
  add16RAM(pc2);
  pc2.printInfo();
  assert(pc2.ram == 32);
  
  List<PC> pcs = [pc2, pc3, pc4];
  List<PC> pcs2 = [pc1, ...pcs];
  print("pcs2.length = ${pcs2.length}");
    

  // Special made error to show working assert
  print("=== Upgrade RAM ===");  
  add16RAM(pc3);
  pc3.printInfo();
  assert(pc3.ram == 11, "Ram upgrade failed");
}

//dart --enable-asserts file_name.dart
// to enable asserts in dart