abstract class NewsEvents {}

class Read extends NewsEvents {
  Read();
}

class ClearList extends NewsEvents {
  ClearList();
}

class UpdatePage extends NewsEvents {
  int page;
  UpdatePage(this.page);
}
