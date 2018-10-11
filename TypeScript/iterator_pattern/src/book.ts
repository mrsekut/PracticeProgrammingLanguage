export default class Book {
  private authorIterator;

  constructor(authorList) {
    this.authorIterator = authorList.createIterator();
  }

  printAuthors() {
    while (this.authorIterator.hasNext()) {
      const author = this.authorIterator.next();
      console.log(author);
    }
  }
}
