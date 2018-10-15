import AuthorList from './aggreagate';
import AuthorListSimpleIterator from './concreteIterator';
import { Author } from './index.d';

export default class AuthorSimple implements AuthorList {
  public authorList: Author[];

  constructor(authors: Author[]) {
    this.authorList = authors;
  }

  public addToList(author: Author) {
    this.authorList.push(author);
  }

  public getAuthorList() {
    return this.authorList;
  }

  public createIterator() {
    return new AuthorListSimpleIterator(this.authorList);
  }
}
