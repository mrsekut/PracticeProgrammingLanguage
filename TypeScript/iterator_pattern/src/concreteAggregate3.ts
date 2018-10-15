import AuthorList from './aggreagate';
import AuthorListDetailedOrderByIdIterator from './concreteIterator3';
import AuthorListMethods from './concreteAggregateMixin';
import { AuthorDetailedList } from './index.d';

export default class AuthorsDetailedOrderById
  implements AuthorListMethods<AuthorDetailedList>, AuthorList {
  addToList!: (author: AuthorDetailedList) => void;
  getAuthorList!: () => AuthorDetailedList[];

  constructor(public authorList: AuthorDetailedList[]) {}

  createIterator() {
    return new AuthorListDetailedOrderByIdIterator(this.authorList);
  }
}
