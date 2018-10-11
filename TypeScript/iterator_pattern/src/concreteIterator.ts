import AuthorIterator from './iterator';

export default class AuthorListSimpleIterator implements AuthorIterator {
  private authors: any;
  private position = 0;

  constructor(authors) {
    this.authors = authors;
  }

  public hasNext() {
    return this.position < this.authors.length;
  }

  public next() {
    return this.authors[this.position++];
  }
}
