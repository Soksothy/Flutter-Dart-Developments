class Window {
  String color;
  String position;
  int floor;
  Window(this.color,this.position, this.floor);
}

class Roof {
  String type;
  int floor;
  String color;
  Roof(this.type, this.floor,this.color);
}

class Stair {
  String position;
  Stair(this.position);
}

class Chimney {
  String type;
  Chimney(this.type);
}

class Door {
  String position;
  Door(this.position);
}

class Room {
  String name;
  int floor;
  Room(this.name, this.floor);
}

class House {
  int floor;
  List<Room> rooms = [];
  List<Window> window = [];
  List<Roof> roofs = [];
  Stair stair;
  Chimney chimney;
  Door door;
  House(this.floor, this.stair, this.chimney, this.door);

  void AddRoom(Room MoreRoom) {
    this.rooms.add(MoreRoom);
  }
  void AddWindow(Window MoreWindow) {
    this.window.add(MoreWindow);
  }
  void AddRoof(Roof MoreRoof) {
    this.roofs.add(MoreRoof);
  }

  void house_info() {
    print('House with $floor floors');
    print('------------------------------------------------');

    for (var room in rooms) {
      print(' Room: ${room.name} on ${room.floor} floor');
    }
    print('------------------------------------------------');

    for (var window in window) {
      print(' Window on floor ${window.floor} with color ${window.color} with position on ${window.position} ');
    }
    print('------------------------------------------------');

    for (var roof in roofs) {
      print(' Roof: ${roof.type} on floor ${roof.floor} Color is ${roof.color}');
    }
    print('------------------------------------------------');
    print('Stair is the: ${stair.position} of the house.');
    print('------------------------------------------------');
    print('Chimney is made form : ${chimney.type}');
    print('------------------------------------------------');
    print('Door is on : ${door.position} of the house');
    print('------------------------------------------------');
  }
}
void main() {

  House Sothy_home = House(2, Stair("Left"), Chimney('Brick'), Door('Center'));

  Sothy_home.AddRoom(Room('Living Room', 1));
  Sothy_home.AddRoom(Room('Kitchen', 1));
  Sothy_home.AddRoom(Room('Gojo', 2));
  Sothy_home.AddRoom(Room('San`s Bedroom ', 2));


  Sothy_home.AddWindow(Window('Red','Button right', 1));
  Sothy_home.AddWindow(Window('Green','Button left', 1));
  Sothy_home.AddWindow(Window('Pink','Top right',2));
  Sothy_home.AddWindow(Window('Red','Top left', 2));


  Sothy_home.AddRoof(Roof('Flat', 1,'Black'));
  Sothy_home.AddRoof(Roof('Triangle', 2,'Red'));

  Sothy_home.house_info();
}