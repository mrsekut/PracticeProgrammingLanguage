import AuthorList from './aggreagate';
import AuthorListDetailedIterator from './concreteIterator2';
import AuthorListMethods from './concreteAggregateMixin';
import { AuthorDetailedList } from './index.d';

export default class AuthorsDetailed
  implements AuthorListMethods<AuthorDetailedList>, AuthorList {
  addToList!: (author: AuthorDetailedList) => void;
  getAuthorList!: () => AuthorDetailedList[];

  constructor(public authorList: AuthorDetailedList[]) {}

  createIterator() {
    return new AuthorListDetailedIterator(this.authorList);
  }
}
