class Window {
  String color;
  int floor;
  Window(this.color, this.floor);
}

class Roof {
  String type;
  int floor;
  Roof(this.type, this.floor);
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
  int floors;
  List<Room> rooms = [];
  List<Window> window = [];
  List<Roof> roofs = [];
  Stair stair;
  Chimney chimney;
  Door door;
  House(this.floors, this.stair, this.chimney, this.door);

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
    print('House with $floors floors:');

    for (var room in rooms) {
      print(' Room: ${room.name} on ${room.floor} floor');
    }

    for (var window in window) {
      print(' Window on floor ${window.floor} with color ${window.color}');
    }

    for (var roof in roofs) {
      print(' Roof: ${roof.type} on floor ${roof.floor}');
    }
    print('Stair: ${stair.position}');
    print('Chimney: ${chimney.type}');
    print('Door: ${door.position}');
  }
}
void main() {

  House Thy_home = House(2, Stair("Left"), Chimney('Brick'), Door('Center'));

  Thy_home.AddRoom(Room('Living Room', 1));
  Thy_home.AddRoom(Room('Kitchen', 1));
  Thy_home.AddRoom(Room('Gojo`s Bedroom', 2));
  Thy_home.AddRoom(Room('San`s Bedroom ', 2));

  Thy_home.AddWindow(Window('Red', 1));
  Thy_home.AddWindow(Window('Blue', 1));
  Thy_home.AddWindow(Window('Green', 2));
  Thy_home.AddWindow(Window('Yellow', 2));

  Thy_home.AddRoof(Roof('Gabled', 1));
  Thy_home.AddRoof(Roof('Flat', 2));

  Thy_home.house_info();
}