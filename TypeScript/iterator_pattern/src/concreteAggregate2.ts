import AuthorListDetailedIterator from './concreteIterator2';
import AuthorListMethods from './concreteAggregateMixin';

// // これ消してgenericにする? 今のAuthorSimpleみたいに
type AuthorDetailedList = {
  familyName: string;
  givenName: string;
  id: number;
};

export default class AuthorsDetailed extends AuthorListMethods<
  AuthorDetailedList
> {
  addToList!: (author: AuthorDetailedList) => void;
  getAuthorList!: () => AuthorDetailedList[];

  constructor(public authorList: AuthorDetailedList[]) {
    super(authorList);
  }

  public createIterator() {
    return new AuthorListDetailedIterator(this.authorList);
  }
}
