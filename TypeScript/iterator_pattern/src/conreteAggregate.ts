import AuthorListSimplIterator from './concreteIterator';
import AuthorList from './aggreagate';

export default class AuthorSimple implements AuthorList {
  public authorList;

  constructor(authors) {
    this.authorList = authors;
  }

  public addToList(author) {
    this.authorList = author;
  }

  public getAuthorList() {
    return this.authorList;
  }

  public createIterator() {
    return new AuthorListSimplIterator(this.authorList);
  }
}
