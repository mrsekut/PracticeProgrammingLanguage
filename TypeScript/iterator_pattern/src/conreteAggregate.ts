import AuthorList from './aggreagate';
import AuthorListSimpleIterator from './concreteIterator';
import AuthorIterator from './Iterator';

export default class AuthorSimple<T> implements AuthorList {
  public authorList: T[];

  constructor(authors: T[]) {
    this.authorList = authors;
  }

  public addToList(author: T[]) {
    this.authorList = author;
  }

  public getAuthorList() {
    return this.authorList;
  }

  public createIterator(): AuthorIterator {
    return new AuthorListSimpleIterator(this.authorList);
  }
}
