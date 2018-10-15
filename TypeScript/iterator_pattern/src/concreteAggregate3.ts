import AuthorList from './aggreagate';
import AuthorListDetailedOrderByIdIterator from './concreteIterator3';
import AuthorListMethods from './concreteAggregateMixin';

// これ消してgenericにする? 今のAuthorSimpleみたいに
type AuthorDetailedList = {
  familyName: string;
  givenName: string;
  id: number;
};

export default class AuthorsDetailedOrderById
  extends AuthorListMethods<AuthorDetailedList>
  implements AuthorList {
  public authorList: AuthorDetailedList[];

  constructor(authors: AuthorDetailedList[]) {
    super();
    this.authorList = authors;
  }

  public addToList(author: AuthorDetailedList) {
    this.authorList.push(author);
  }

  public getAuthorList() {
    return this.authorList;
  }

  public createIterator() {
    return new AuthorListDetailedOrderByIdIterator(this.authorList);
  }
}
