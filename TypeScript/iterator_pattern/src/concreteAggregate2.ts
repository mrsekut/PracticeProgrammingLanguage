import AuthorList from './aggreagate';
import AuthorListDetailedIterator from './concreteIterator2';

// これ消してgenericにする? 今のAuthorSimpleみたいに
type AuthorDetailed = {
  familyName: string;
  givenName: string;
  id: number;
};

export default class AuthorsDetailed implements AuthorList {
  public authorList: AuthorDetailed[];

  constructor(authors: AuthorDetailed[]) {
    this.authorList = authors;
  }

  public addToList(author: AuthorDetailed) {
    this.authorList.push(author);
  }

  public getAuthorList() {
    return this.authorList;
  }

  public createIterator() {
    return new AuthorListDetailedIterator(this.authorList);
  }
}
