import AuthorList from './aggreagate';
import AuthorIterator from './iterator';
export default class Book {
  private authorIterator: AuthorIterator;

  constructor(authorList: AuthorList) {
    this.authorIterator = authorList.createIterator();
  }

  printAuthors() {
    while (this.authorIterator.hasNext()) {
      const author = this.authorIterator.next();
      console.log(author);
    }
  }
}
