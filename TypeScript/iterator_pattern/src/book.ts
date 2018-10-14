import AuthorList from './aggreagate';
import AuthorIterator from './iterator';
export default class Book<T> {
  private authorIterator: AuthorIterator<T>;

  constructor(authorList: AuthorList<T>) {
    this.authorIterator = authorList.createIterator();
  }

  printAuthors() {
    while (this.authorIterator.hasNext()) {
      const author = this.authorIterator.next();
      console.log(author);
    }
  }
}
