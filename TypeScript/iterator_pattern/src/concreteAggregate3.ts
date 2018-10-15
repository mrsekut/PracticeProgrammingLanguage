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
  addToList!: (author: AuthorDetailedList) => void;
  getAuthorList!: () => AuthorDetailedList[];

  constructor(public authorList: AuthorDetailedList[]) {
    super(authorList);
  }

  public createIterator() {
    return new AuthorListDetailedOrderByIdIterator(this.authorList);
  }
}
