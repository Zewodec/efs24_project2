import 'dart:io';

typedef JSON = Map<String, dynamic>;

Function upgradeRAM = (int RamToAdd) {
    return (PC pc) {
      pc.ram = pc.ram! + RamToAdd;
    };
  };

class PC with PCUpgrade {
  int price;
  String? graphicCard;
  String? processor;
  int? ram;
  String? motherboard;

  Set<String> installedPrograms = {};
  List<String> addtionalComponents = [];

  PC(
      {required this.price,
      this.graphicCard,
      this.processor,
      this.ram,
      this.motherboard}) : assert(price > 0);

  PC.init(
      {this.price = 70000,
      this.graphicCard = "NVIDIA 4090 RTX",
      this.processor = "AMD RYZEN 5 5600",
      this.ram = 16,
      this.motherboard = "MSI B450"});

  PC.basicPC(
      [this.price = 5000,
      this.graphicCard,
      this.processor,
      this.ram,
      this.motherboard]) {
    graphicCard ??= "NVIDIA 3060 RTX";
    processor ??= "Intel Core i5";
    ram ??= 8;
    motherboard ??= "ASUS B450";
  }

  factory PC.manualInput() {
    // get info from user
    print("Enter price: ");
    int price = int.parse(stdin.readLineSync() ?? "30000");
    print("Enter graphic card: ");
    String graphicCard = stdin.readLineSync() ?? "NVIDIA 3040 RTX";
    print("Enter processor: ");
    String processor = stdin.readLineSync() ?? "Intel Core i7";
    print("Enter RAM: ");
    int ram = int.parse(stdin.readLineSync() ?? "16");
    print("Enter motherboard: ");
    String motherboard = stdin.readLineSync() ?? "ASUS B150";
    return PC(
        price: price,
        graphicCard: graphicCard,
        processor: processor,
        ram: ram,
        motherboard: motherboard);
  }

  void printInfo() {
    print("========== PC INFO ==========");
    print("Price: $price");
    print("Graphic card: $graphicCard");
    print("Processor: $processor");
    print("RAM: $ram");
    print("Motherboard: $motherboard");
    print(installedPrograms.isNotEmpty
        ? "Installed programs: $installedPrograms"
        : "No installed programs");
    print(addtionalComponents.isNotEmpty
        ? "Additional components: $addtionalComponents"
        : "No additional components");
    print("=============================");
  }

  JSON toJSON() {
    return {
      "price": price,
      "graphicCard": graphicCard,
      "processor": processor,
      "ram": ram,
      "motherboard": motherboard,
      "installedPrograms": installedPrograms,
      "addtionalComponents": addtionalComponents
    };
  }

  void installProgram(String program) => installedPrograms.add(program);

  void installComponent(String component) => addtionalComponents.add(component);

  void shortInfo() =>
      "Price: $price, RAM: $ram, Graphic card: $graphicCard, Processor: $processor, Motherboard: $motherboard";
}

mixin PCUpgrade {
  void upgradePC(PC pc, String newGraphicCard, String newProcessor, int newRam,
      String newMotherboard, int newPrice) {
    pc.graphicCard = newGraphicCard;
    pc.processor = newProcessor;
    pc.ram = newRam;
    pc.motherboard = newMotherboard;
    pc.price += newPrice;
  }

  void removeComponent(PC pc, String component) {
    pc.addtionalComponents.remove(component);
  }
}
